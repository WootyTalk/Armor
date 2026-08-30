#!/bin/bash

# Script para remover dependências fazer.ai e renomear para wootytalk-agents

echo "🧹 Iniciando limpeza de referências fazer.ai..."
echo ""

# 1. Remover pasta de updates (Hub fazer.ai)
echo "1️⃣ Removendo módulo de updates fazer.ai..."
rm -rf src/modules/updates/
echo "   ✅ Removido: src/modules/updates/"

# 2. Remover arquivo de affiliate links
echo "2️⃣ Removendo affiliate links fazer.ai..."
rm -f src/client/lib/affiliateLinks.ts
echo "   ✅ Removido: src/client/lib/affiliateLinks.ts"

# 3. Atualizar config.ts - remover URLs fazer.ai
echo "3️⃣ Atualizando configurações..."
sed -i 's|FAZER_AI_HUB_URL,||g' src/config.ts
sed -i 's|AGENTS_UPDATE_CHECK_URL,||g' src/config.ts
sed -i 's|HUB_UPDATES_TTL_MS,||g' src/config.ts
echo "   ✅ Removidas variáveis fazer.ai de config.ts"

# 4. Atualizar branding padrão
echo "4️⃣ Customizando branding padrão..."
sed -i 's|DEFAULT_BRAND_NAME = "fazer.ai agents"|DEFAULT_BRAND_NAME = "wootytalk-agents"|g' src/lib/branding.ts
echo "   ✅ Branding customizado"

# 5. Remover controller de updates do Elysia
echo "5️⃣ Removendo rota de updates..."
sed -i '/updatesController/d' src/app.ts
echo "   ✅ Rota removida de src/app.ts"

# 6. Remover import de updates do index.ts
echo "6️⃣ Limpando imports..."
sed -i '/modules\/updates/d' src/api/index.ts
echo "   ✅ Imports limpos"

# 7. Atualizar package.json
echo "7️⃣ Atualizando package.json..."
sed -i 's|"name": "agents"|"name": "wootytalk-agents"|g' package.json
sed -i 's|"fazer-ai/agents"|"WootyTalk/agent-manager"|g' package.json
echo "   ✅ package.json atualizado"

# 8. Atualizar README
echo "8️⃣ Customizando README..."
sed -i 's|fazer.ai agents|wootytalk-agents|g' README.md
sed -i 's|fazer-ai/agents|WootyTalk/agent-manager|g' README.md
echo "   ✅ README atualizado"

# 9. Atualizar título HTML
echo "9️⃣ Atualizando title do HTML..."
sed -i 's|<title>fazer.ai agents</title>|<title>wootytalk-agents</title>|g' public/index.html
echo "   ✅ Título atualizado"

# 10. Remover variáveis fazer.ai do .env.example
echo "🔟 Limpando .env.example..."
sed -i '/FAZER_AI_HUB_URL/d' .env.example
sed -i '/AGENTS_UPDATE_CHECK_URL/d' .env.example
sed -i '/HUB_UPDATES_TTL_MS/d' .env.example
echo "   ✅ .env.example limpo"

# 11. Atualizar CLAUDE.md
echo "1️⃣1️⃣ Removendo referências do CLAUDE.md..."
sed -i '/updates.md/d' CLAUDE.md
sed -i "s|fazer.ai|wootytalk|g" CLAUDE.md
echo "   ✅ CLAUDE.md atualizado"

echo ""
echo "✨ Limpeza concluída!"
echo ""
echo "📋 Próximas etapas:"
echo "1. Revisar mudanças: git diff"
echo "2. Testar build: bun build"
echo "3. Testar app: bun dev"
echo "4. Commit: git add -A && git commit -m 'Remove fazer.ai dependencies'"
echo "5. Push: git push origin main"
