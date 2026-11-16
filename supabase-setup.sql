-- Caderneta da Casa — preparar a base de dados
-- Cole tudo isto em Supabase → SQL Editor → New query → Run.

create table if not exists public.docs (
  user_id    uuid        not null default auth.uid() references auth.users(id) on delete cascade,
  path       text        not null,          -- "config/main" ou "meses/2026-11"
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, path)
);

-- Cada pessoa só vê e altera os seus próprios dados
alter table public.docs enable row level security;

drop policy if exists "ler os meus dados"     on public.docs;
drop policy if exists "criar os meus dados"   on public.docs;
drop policy if exists "alterar os meus dados" on public.docs;
drop policy if exists "apagar os meus dados"  on public.docs;

create policy "ler os meus dados"     on public.docs for select to authenticated using (auth.uid() = user_id);
create policy "criar os meus dados"   on public.docs for insert to authenticated with check (auth.uid() = user_id);
create policy "alterar os meus dados" on public.docs for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "apagar os meus dados"  on public.docs for delete to authenticated using (auth.uid() = user_id);

-- Sincronização em tempo real entre PC e telemóveis
do $$ begin
  alter publication supabase_realtime add table public.docs;
exception when duplicate_object then null; end $$;
