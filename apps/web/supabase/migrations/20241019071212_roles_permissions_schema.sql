alter table "public"."role_permissions" drop constraint "role_permissions_pkey";
drop index if exists "public"."role_permissions_pkey";
create table "public"."permissions" (
  "id" bigint generated by default as identity not null,
  "permission" character varying not null
);
alter table "public"."permissions" enable row level security;
create table "public"."roles" (
  "id" bigint generated by default as identity not null,
  "role" character varying not null
);
alter table "public"."roles" enable row level security;
alter table "public"."role_permissions" drop column "permissions";
alter table "public"."role_permissions" drop column "role";
alter table "public"."role_permissions"
add column "id" bigint generated by default as identity not null;
alter table "public"."role_permissions"
add column "permission_id" bigint not null;
alter table "public"."role_permissions"
add column "role_id" bigint not null;
alter table "public"."users" drop column "role";
alter table "public"."users"
add column "role_id" bigint;
drop type "public"."permission_enum";
drop type "public"."role_enum";
CREATE UNIQUE INDEX permissions_pkey ON public.permissions USING btree (id);
CREATE UNIQUE INDEX roles_pkey ON public.roles USING btree (id);
CREATE UNIQUE INDEX role_permissions_pkey ON public.role_permissions USING btree (id);
alter table "public"."permissions"
add constraint "permissions_pkey" PRIMARY KEY using index "permissions_pkey";
alter table "public"."roles"
add constraint "roles_pkey" PRIMARY KEY using index "roles_pkey";
alter table "public"."role_permissions"
add constraint "role_permissions_pkey" PRIMARY KEY using index "role_permissions_pkey";
alter table "public"."role_permissions"
add constraint "role_permissions_permission_id_fkey" FOREIGN KEY (permission_id) REFERENCES permissions(id) not valid;
alter table "public"."role_permissions" validate constraint "role_permissions_permission_id_fkey";
alter table "public"."role_permissions"
add constraint "role_permissions_role_id_fkey" FOREIGN KEY (role_id) REFERENCES roles(id) not valid;
alter table "public"."role_permissions" validate constraint "role_permissions_role_id_fkey";
alter table "public"."users"
add constraint "users_role_id_fkey" FOREIGN KEY (role_id) REFERENCES roles(id) not valid;
alter table "public"."users" validate constraint "users_role_id_fkey";
grant delete on table "public"."permissions" to "anon";
grant insert on table "public"."permissions" to "anon";
grant references on table "public"."permissions" to "anon";
grant select on table "public"."permissions" to "anon";
grant trigger on table "public"."permissions" to "anon";
grant truncate on table "public"."permissions" to "anon";
grant update on table "public"."permissions" to "anon";
grant delete on table "public"."permissions" to "authenticated";
grant insert on table "public"."permissions" to "authenticated";
grant references on table "public"."permissions" to "authenticated";
grant select on table "public"."permissions" to "authenticated";
grant trigger on table "public"."permissions" to "authenticated";
grant truncate on table "public"."permissions" to "authenticated";
grant update on table "public"."permissions" to "authenticated";
grant delete on table "public"."permissions" to "service_role";
grant insert on table "public"."permissions" to "service_role";
grant references on table "public"."permissions" to "service_role";
grant select on table "public"."permissions" to "service_role";
grant trigger on table "public"."permissions" to "service_role";
grant truncate on table "public"."permissions" to "service_role";
grant update on table "public"."permissions" to "service_role";
grant delete on table "public"."roles" to "anon";
grant insert on table "public"."roles" to "anon";
grant references on table "public"."roles" to "anon";
grant select on table "public"."roles" to "anon";
grant trigger on table "public"."roles" to "anon";
grant truncate on table "public"."roles" to "anon";
grant update on table "public"."roles" to "anon";
grant delete on table "public"."roles" to "authenticated";
grant insert on table "public"."roles" to "authenticated";
grant references on table "public"."roles" to "authenticated";
grant select on table "public"."roles" to "authenticated";
grant trigger on table "public"."roles" to "authenticated";
grant truncate on table "public"."roles" to "authenticated";
grant update on table "public"."roles" to "authenticated";
grant delete on table "public"."roles" to "service_role";
grant insert on table "public"."roles" to "service_role";
grant references on table "public"."roles" to "service_role";
grant select on table "public"."roles" to "service_role";
grant trigger on table "public"."roles" to "service_role";
grant truncate on table "public"."roles" to "service_role";
grant update on table "public"."roles" to "service_role";
create policy "Allow authenticated to read (select) permission" on "public"."permissions" as permissive for
select to authenticated using (true);
create policy "Allow authenticated to read (select) role and it's permission" on "public"."role_permissions" as permissive for
select to authenticated using (true);
create policy "Allow authenticated to read (select) roles" on "public"."roles" as permissive for
select to authenticated using (true);