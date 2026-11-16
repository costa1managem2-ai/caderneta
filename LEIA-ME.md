# Caderneta da Casa: pôr no ar

O site é estático (GitHub Pages) e os dados ficam no Supabase, com login.
O mesmo email e senha no PC, no iPhone e no Android = os mesmos dados, sincronizados.

## 1. Base de dados (Supabase, grátis)
1. Em https://supabase.com, crie uma conta e um projeto novo ("caderneta"). Para a região escolha West EU (Ireland). Guarde a password da base de dados.
2. Abra **SQL Editor → New query**, cole o conteúdo de `supabase-setup.sql` e carregue em **Run**.
3. Em **Authentication → Users → Add user → Create new user**, escreva o seu email e uma senha. Marque **Auto Confirm User**.
4. Em **Authentication → Sign In / Providers**, desligue **Allow new users to sign up**. Assim só a sua conta existe.
5. Em **Authentication → URL Configuration**, ponha como **Site URL** o endereço do site (passo 2).
6. Em **Project Settings → API Keys** (ou **API**), copie o **Project URL** e a chave **publishable / anon public** e ponha-os em `config.js`.
   Nunca use a chave **secret / service_role**.

## 2. Site (GitHub Pages, grátis)
1. No GitHub, crie o repositório `caderneta` (Public) e envie estes ficheiros (Add file → Upload files).
2. Vá a **Settings → Pages → Source: Deploy from a branch → main / (root)** e guarde.
3. O site fica em `https://<utilizador>.github.io/caderneta/`.

## 3. Primeira utilização
- Entre com o email e a senha. Depois, em "Bem-vindo", importe `caderneta-backup.json` com o histórico.
- **iPhone:** abra o site no Safari → botão Partilhar → **Adicionar ao ecrã principal**.
- **Android:** abra o site no Chrome → menu ⋮ → **Instalar aplicação** (ou **Adicionar ao ecrã principal**).

## Bom saber
- No plano grátis, o Supabase põe o projeto em pausa se passar 7 dias sem ser usado. Se acontecer, abra o painel do Supabase e carregue em **Restore**.
- Faça de vez em quando uma cópia de segurança em **Definições → Cópias de segurança**.
