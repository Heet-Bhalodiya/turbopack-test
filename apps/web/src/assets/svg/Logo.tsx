// React Imports
import type { SVGAttributes } from 'react'

const Logo = (props: SVGAttributes<SVGElement> & { linearGradientId?: string }) => {
  // Props
  const { linearGradientId, ...rest } = props

  return (
    <svg width='1em' height='1em' fill='none' viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg' {...rest}>
      <g clipPath={`url(#clip0_${linearGradientId ?? '9505_59832'})`}>
        <mask
          id={`mask0_${linearGradientId ?? '9505_59832'}`}
          style={{ maskType: 'luminance' }}
          maskUnits='userSpaceOnUse'
          x='0'
          y='0'
          width='32'
          height='32'
        >
          <path
            d='M24 0H8C3.58172 0 0 3.58172 0 8V24C0 28.4183 3.58172 32 8 32H24C28.4183 32 32 28.4183 32 24V8C32 3.58172 28.4183 0 24 0Z'
            fill='white'
          />
        </mask>
        <g mask={`url(#mask0_${linearGradientId ?? '9505_59832'})`}>
          <path
            d='M24 0H8C3.58172 0 0 3.58172 0 8V24C0 28.4183 3.58172 32 8 32H24C28.4183 32 32 28.4183 32 24V8C32 3.58172 28.4183 0 24 0Z'
            fill='currentColor'
          />
          <path d='M32 0H0V32H32V0Z' fill={`url(#paint0_linear_${linearGradientId ?? '9505_59832'})`} />
          <g clipPath={`url(#clip1_${linearGradientId ?? '9505_59832'})`}>
            <path
              d='M17.9738 16.6028C18.8603 17.4027 20.2519 17.9857 21.4818 18.3797C22.4905 18.7029 22.9948 18.8645 22.9948 19.0313C22.9948 19.1981 22.4905 19.3597 21.4818 19.6829C20.2519 20.0768 18.8603 20.6599 17.9738 21.4599C16.8814 22.4455 16.1395 24.136 15.6615 25.6406C15.2827 26.8327 15.0933 27.4288 14.9261 27.4288C14.7589 27.4288 14.5695 26.8327 14.1908 25.6406C13.7127 24.136 12.9709 22.4455 11.8785 21.4599C10.992 20.6599 9.60035 20.0768 8.3705 19.6829C7.36179 19.3597 6.85742 19.1981 6.85742 19.0313C6.85742 18.8645 7.36179 18.7029 8.3705 18.3797C9.60035 17.9857 10.992 17.4027 11.8785 16.6028C12.9709 15.6171 13.7127 13.9266 14.1908 12.4219C14.5695 11.2298 14.7589 10.6338 14.9261 10.6338C15.0933 10.6338 15.2827 11.2299 15.6615 12.4219C16.1395 13.9266 16.8814 15.6171 17.9738 16.6028Z'
              fill='white'
            />
            <path
              d='M23.8471 13.6935C23.9924 13.8237 24.1795 13.9361 24.3806 14.0317C24.8893 14.2739 25.1437 14.395 25.1437 14.4761C25.1437 14.5573 24.8893 14.6784 24.3806 14.9205C24.1795 15.0162 23.9924 15.1286 23.8471 15.2588C23.6647 15.4222 23.5124 15.6458 23.3864 15.8903C23.087 16.4714 22.9374 16.7618 22.858 16.7618C22.7786 16.7618 22.629 16.4714 22.3295 15.8903C22.2036 15.6458 22.0512 15.4222 21.8688 15.2588C21.7236 15.1286 21.5365 15.0162 21.3354 14.9205C20.8267 14.6784 20.5723 14.5573 20.5723 14.4761C20.5723 14.395 20.8267 14.2739 21.3354 14.0317C21.5365 13.9361 21.7236 13.8237 21.8688 13.6935C22.0512 13.5301 22.2036 13.3065 22.3295 13.0619C22.629 12.4809 22.7786 12.1904 22.858 12.1904C22.9374 12.1904 23.087 12.4809 23.3864 13.0619C23.5124 13.3065 23.6647 13.5301 23.8471 13.6935Z'
              fill='white'
            />
            <path
              d='M20.9532 7.33237C21.3087 7.65448 21.8269 7.90655 22.3353 8.09577C22.9668 8.33071 23.2824 8.44818 23.2824 8.55143C23.2824 8.65466 22.9668 8.77213 22.3353 9.00707C21.8269 9.19629 21.3087 9.44836 20.9532 9.77047C20.5148 10.1675 20.1894 10.7924 19.9544 11.4141C19.6728 12.159 19.532 12.5316 19.4293 12.5316C19.3266 12.5316 19.1858 12.159 18.9042 11.4141C18.6693 10.7924 18.3438 10.1675 17.9055 9.77047C17.5498 9.44836 17.0318 9.19629 16.5232 9.00707C15.8919 8.77213 15.5762 8.65466 15.5762 8.55143C15.5762 8.44818 15.8919 8.33071 16.5232 8.09577C17.0318 7.90656 17.5498 7.65448 17.9055 7.33237C18.3438 6.93535 18.6693 6.31045 18.9042 5.68879C19.1858 4.94379 19.3266 4.57129 19.4293 4.57129C19.532 4.57129 19.6728 4.94379 19.9544 5.68879C20.1894 6.31045 20.5148 6.93535 20.9532 7.33237Z'
              fill='white'
            />
          </g>
        </g>
        <path
          d='M23.9993 0.666016H7.99935C3.94926 0.666016 0.666016 3.94926 0.666016 7.99935V23.9993C0.666016 28.0494 3.94926 31.3327 7.99935 31.3327H23.9993C28.0494 31.3327 31.3327 28.0494 31.3327 23.9993V7.99935C31.3327 3.94926 28.0494 0.666016 23.9993 0.666016Z'
          stroke={`url(#paint1_linear_${linearGradientId ?? '9505_59832'})`}
          strokeWidth='2'
        />
      </g>
      <defs>
        <linearGradient
          id={`paint0_linear_${linearGradientId ?? '9505_59832'}`}
          x1='16'
          y1='3.57628e-07'
          x2='17.3333'
          y2='32'
          gradientUnits='userSpaceOnUse'
        >
          <stop stopColor='white' stopOpacity='0' />
          <stop offset='1' stopColor='white' stopOpacity='0.12' />
        </linearGradient>
        <linearGradient
          id={`paint1_linear_${linearGradientId ?? '9505_59832'}`}
          x1='15.9994'
          y1='-0.000651103'
          x2='15.9994'
          y2='31.9994'
          gradientUnits='userSpaceOnUse'
        >
          <stop stopColor='white' stopOpacity='0.12' />
          <stop offset='1' stopColor='white' stopOpacity='0' />
        </linearGradient>
        <clipPath id={`clip0_${linearGradientId ?? '9505_59832'}`}>
          <rect width='32' height='32' fill='white' />
        </clipPath>
        <clipPath id={`clip1_${linearGradientId ?? '9505_59832'}`}>
          <rect width='22.8571' height='22.8571' fill='white' transform='translate(4.57227 4.57129)' />
        </clipPath>
      </defs>
    </svg>
  )
}

export default Logo