'use client'

// React Imports
import { Children, createContext, forwardRef, useContext, useId } from 'react'
import type { ComponentPropsWithoutRef, ElementRef, HTMLAttributes } from 'react'

// Third-party Imports
import { Slot } from '@radix-ui/react-slot'
import { Controller, FormProvider, useFormContext } from 'react-hook-form'
import type * as LabelPrimitive from '@radix-ui/react-label'
import type { ControllerProps, FieldPath, FieldValues } from 'react-hook-form'

import { cn } from '@repo/ui/lib/utils'
import { Label } from './label'

const Form = FormProvider

type FormFieldContextValue<
  TFieldValues extends FieldValues = FieldValues,
  TName extends FieldPath<TFieldValues> = FieldPath<TFieldValues>
> = {
  name: TName
}

const FormFieldContext = createContext<FormFieldContextValue>({} as FormFieldContextValue)

const FormField = <
  TFieldValues extends FieldValues = FieldValues,
  TName extends FieldPath<TFieldValues> = FieldPath<TFieldValues>
>({
  ...props
}: ControllerProps<TFieldValues, TName>) => {
  return (
    <FormFieldContext.Provider value={{ name: props.name }}>
      <Controller {...props} />
    </FormFieldContext.Provider>
  )
}

const useFormField = () => {
  const fieldContext = useContext(FormFieldContext)
  const itemContext = useContext(FormItemContext)
  const { getFieldState, formState } = useFormContext()

  const fieldState = getFieldState(fieldContext.name, formState)

  if (!fieldContext) {
    throw new Error('useFormField should be used within <FormField>')
  }

  const { id } = itemContext

  return {
    id,
    name: fieldContext.name,
    formItemId: `${id}-form-item`,
    formDescriptionId: `${id}-form-item-description`,
    formMessageId: `${id}-form-item-message`,
    ...fieldState
  }
}

type FormItemContextValue = {
  id: string
}

const FormItemContext = createContext<FormItemContextValue>({} as FormItemContextValue)

const FormItem = forwardRef<HTMLDivElement, HTMLAttributes<HTMLDivElement>>(({ className, ...props }, ref) => {
  const id = useId()

  return (
    <FormItemContext.Provider value={{ id }}>
      <div ref={ref} className={cn('space-y-2', className)} {...props} />
    </FormItemContext.Provider>
  )
})

FormItem.displayName = 'FormItem'

const FormLabel = forwardRef<
  ElementRef<typeof LabelPrimitive.Root>,
  ComponentPropsWithoutRef<typeof LabelPrimitive.Root>
>(({ className, ...props }, ref) => {
  const { error, formItemId } = useFormField()

  return <Label ref={ref} className={cn(error && 'text-destructive', className)} htmlFor={formItemId} {...props} />
})

FormLabel.displayName = 'FormLabel'

const FormControl = forwardRef<ElementRef<typeof Slot>, ComponentPropsWithoutRef<typeof Slot>>(
  ({ children, ...props }, ref) => {
    const { error, formItemId, formDescriptionId, formMessageId } = useFormField()

    // Check if children contain more than one element
    if (Children.count(children) > 1) {
      throw new Error('FormControl must contain only a single child element.')
    }

    return (
      <Slot
        ref={ref}
        id={formItemId}
        aria-describedby={!error ? `${formDescriptionId}` : `${formDescriptionId} ${formMessageId}`}
        aria-invalid={!!error}
        {...props}
      >
        {children}
      </Slot>
    )
  }
)

FormControl.displayName = 'FormControl'

const FormDescription = forwardRef<HTMLParagraphElement, HTMLAttributes<HTMLParagraphElement>>(
  ({ className, ...props }, ref) => {
    const { formDescriptionId } = useFormField()

    return <p ref={ref} id={formDescriptionId} className={cn('text-muted-foreground text-sm', className)} {...props} />
  }
)

FormDescription.displayName = 'FormDescription'

const FormMessage = forwardRef<HTMLParagraphElement, HTMLAttributes<HTMLParagraphElement>>(
  ({ className, children, ...props }, ref) => {
    const { error, formMessageId } = useFormField()
    const body = error ? String(error?.message) : children

    if (!body) {
      return null
    }

    return (
      <p ref={ref} id={formMessageId} className={cn('text-destructive text-sm font-medium', className)} {...props}>
        {body}
      </p>
    )
  }
)

FormMessage.displayName = 'FormMessage'

export { useFormField, Form, FormItem, FormLabel, FormControl, FormDescription, FormMessage, FormField }
