alter table "public"."users" drop constraint "users_role_id_fkey";
create table "public"."user_roles" (
  "role_id" bigint not null,
  "user_id" bigint not null
);
alter table "public"."user_roles" enable row level security;
alter table "public"."users" drop column "role_id";
alter table "public"."users"
add column "id" bigint generated by default as identity not null;
CREATE UNIQUE INDEX user_roles_pkey ON public.user_roles USING btree (role_id, user_id);
CREATE UNIQUE INDEX users_id_key ON public.users USING btree (id);
alter table "public"."user_roles"
add constraint "user_roles_pkey" PRIMARY KEY using index "user_roles_pkey";
alter table "public"."user_roles"
add constraint "user_roles_role_id_fkey" FOREIGN KEY (role_id) REFERENCES roles(id) not valid;
alter table "public"."user_roles" validate constraint "user_roles_role_id_fkey";
alter table "public"."user_roles"
add constraint "user_roles_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE not valid;
alter table "public"."user_roles" validate constraint "user_roles_user_id_fkey";
alter table "public"."users"
add constraint "users_id_key" UNIQUE using index "users_id_key";
set check_function_bodies = off;
CREATE OR REPLACE FUNCTION public.handle_new_user_role() RETURNS trigger LANGUAGE plpgsql AS $function$ BEGIN -- Assign the default role to the new user in the user_roles table
INSERT INTO public.user_roles (user_id, role_id)
VALUES (NEW.id, '2');
-- '2' represents the default role ID
-- Return the newly created row for further processing
RETURN NEW;
END;
$function$;
CREATE OR REPLACE FUNCTION public.handle_update_user() RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER AS $function$BEGIN -- Update the user's information in the public.users table if the user already exists
UPDATE public.users
SET email = NEW.raw_user_meta_data->>'email',
  name = NEW.raw_user_meta_data->>'name'
WHERE user_id = NEW.id;
RETURN NEW;
END;
$function$;
CREATE OR REPLACE FUNCTION public.handle_new_user() RETURNS trigger LANGUAGE plpgsql AS $function$BEGIN -- Insert the new user into the users table with essential metadata
INSERT INTO public.users (user_id, name, email)
VALUES (
    NEW.id,
    NEW.raw_user_meta_data->>'name',
    NEW.email
  );
-- Log the action with a notice message to track the user creation
RAISE NOTICE 'User with email (%) has been assigned a default role of user.',
NEW.email;
-- Return the newly created row for further processing
RETURN NEW;
END;
$function$;
grant delete on table "public"."user_roles" to "anon";
grant insert on table "public"."user_roles" to "anon";
grant references on table "public"."user_roles" to "anon";
grant select on table "public"."user_roles" to "anon";
grant trigger on table "public"."user_roles" to "anon";
grant truncate on table "public"."user_roles" to "anon";
grant update on table "public"."user_roles" to "anon";
grant delete on table "public"."user_roles" to "authenticated";
grant insert on table "public"."user_roles" to "authenticated";
grant references on table "public"."user_roles" to "authenticated";
grant select on table "public"."user_roles" to "authenticated";
grant trigger on table "public"."user_roles" to "authenticated";
grant truncate on table "public"."user_roles" to "authenticated";
grant update on table "public"."user_roles" to "authenticated";
grant delete on table "public"."user_roles" to "service_role";
grant insert on table "public"."user_roles" to "service_role";
grant references on table "public"."user_roles" to "service_role";
grant select on table "public"."user_roles" to "service_role";
grant trigger on table "public"."user_roles" to "service_role";
grant truncate on table "public"."user_roles" to "service_role";
grant update on table "public"."user_roles" to "service_role";
grant insert on table "public"."user_roles" to "supabase_auth_admin";
grant select on table "public"."user_roles" to "supabase_auth_admin";
grant update on table "public"."users" to "supabase_auth_admin";
create policy "Allow authenticated to insert users role" on "public"."user_roles" as permissive for
insert to authenticated,
  supabase_auth_admin with check (true);
create policy "Allow authenticated to read (select) users role" on "public"."user_roles" as permissive for
select to authenticated using (true);
create policy "Allow authenticated to update users role" on "public"."user_roles" as permissive for
update to authenticated using (true);
create policy "Allow authenticated to update users" on "public"."users" as permissive for
update to supabase_auth_admin using (true);
CREATE TRIGGER on_public_user_created
AFTER
INSERT ON public.users FOR EACH ROW EXECUTE FUNCTION handle_new_user_role();