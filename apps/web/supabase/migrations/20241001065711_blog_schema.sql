create table "public"."settings_configuration" (
  "id" bigint generated by default as identity not null,
  "key" character varying not null,
  "value" text
);
alter table "public"."settings_configuration" enable row level security;
CREATE UNIQUE INDEX settings_configuration_key_key ON public.settings_configuration USING btree (key);
CREATE UNIQUE INDEX settings_configuration_pkey ON public.settings_configuration USING btree (id);
alter table "public"."settings_configuration"
add constraint "settings_configuration_pkey" PRIMARY KEY using index "settings_configuration_pkey";
alter table "public"."settings_configuration"
add constraint "settings_configuration_key_key" UNIQUE using index "settings_configuration_key_key";
grant delete on table "public"."settings_configuration" to "anon";
grant insert on table "public"."settings_configuration" to "anon";
grant references on table "public"."settings_configuration" to "anon";
grant select on table "public"."settings_configuration" to "anon";
grant trigger on table "public"."settings_configuration" to "anon";
grant truncate on table "public"."settings_configuration" to "anon";
grant update on table "public"."settings_configuration" to "anon";
grant delete on table "public"."settings_configuration" to "authenticated";
grant insert on table "public"."settings_configuration" to "authenticated";
grant references on table "public"."settings_configuration" to "authenticated";
grant select on table "public"."settings_configuration" to "authenticated";
grant trigger on table "public"."settings_configuration" to "authenticated";
grant truncate on table "public"."settings_configuration" to "authenticated";
grant update on table "public"."settings_configuration" to "authenticated";
grant delete on table "public"."settings_configuration" to "service_role";
grant insert on table "public"."settings_configuration" to "service_role";
grant references on table "public"."settings_configuration" to "service_role";
grant select on table "public"."settings_configuration" to "service_role";
grant trigger on table "public"."settings_configuration" to "service_role";
grant truncate on table "public"."settings_configuration" to "service_role";
grant update on table "public"."settings_configuration" to "service_role";
create policy "Allow authenticated to add (insert) settings" on "public"."settings_configuration" as permissive for
insert to authenticated,
  supabase_auth_admin with check (true);
create policy "Allow authenticated to read (select) settings" on "public"."settings_configuration" as permissive for
select to public using (true);
create policy "Allow authenticated to update settings" on "public"."settings_configuration" as permissive for
update to authenticated,
  supabase_auth_admin using (true);
