# Apollo - Spotify Colaborativo para Eventos 🎶🎤
Apollo é uma plataforma interativa onde criadores de eventos podem compartilhar uma playlist colaborativa com o público. Os participantes podem adicionar músicas, votar nas favoritas e definir a ordem de reprodução de forma democrática!

## 👉 Funcionalidades Principais:
- Playlist Colaborativa: Convidados adicionam músicas em tempo real.
- Sistema de Votação: As mais votadas sobem no ranking.
- Node-RED Backend: Gerencia eventos e músicas via Cloudant (IBM).
- Integração com Spotify (atualizações futuras).

## 📌 Tecnologias
### Frontend
SwiftUI

### Backend (Node-RED Flow)
Cloudant (Banco de Dados NoSQL da IBM)
#### APIs REST:
GET /apolloGETMusicas → Busca músicas.
POST /postapollo → Adiciona eventos.
GET /apolloGETEventos → Lista eventos.

## 🚀 Como Rodar o Projeto
Pré-requisitos
Conta no IBM Cloud (para Cloudant) (se necessário)
Node-RED configurado (para o backend)

## Passos
Clone o repositório:
```sh
git clone https://github.com/vschoffent/apollo.git
cd apollo
```
Instale as dependências do frontend:
```sh
npm install
```
Inicie o frontend (Vite):
```sh
npm run dev
```
→ Acesse: http://localhost:3000

## Backend (Node-RED):
- Importe o fluxo fornecido no Node-RED.
- Configure as credenciais do Cloudant.
- Garanta que as rotas /apolloGETMusicas, /postapollo e /apolloGETEventos estejam funcionando.

### 🔧 Estrutura do Backend (Node-RED Flow)
O fluxo gerencia:
Eventos: Armazenados no DB apollo_events.
Músicas: Armazenadas no DB apollo.

### Endpoints
| Rota                | Método | Função                          |
|---------------------|--------|---------------------------------|
| `/apolloGETMusicas` | GET    | Pega todas as músicas           |
| `/postapollo`       | POST   | Cria/atualiza eventos           |
| `/apolloGETEventos` | GET    | Lista eventos cadastrados       |

### 📌 Como Usar (Para Criadores de Eventos)
Crie um evento no sistema.
Compartilhe o link com o público.
Os participantes adicionam músicas e votam.
A playlist é ordenada por votos!

# Hackatruck
Este projeto (Apollo) foi desenvolvido durante o curso HackaTruck Makerspace.
O HackaTruck MakerSpace Serviços Cognitivos é um projeto de capacitação profissional de estudantes de Instituições de Ensino Superior de Tecnologia da Informação, em desenvolvimento iOS para aplicativos móveis com aplicação em Internet das Coisas (IoT), enfatizando a aplicação de conceitos e práticas de serviços cognitivos em nuvem.
O projeto é patrocinado pela IBM Brasil e Flex, em colaboração com a Apple, e executado pelo Instituto de Pesquisas Eldorado
