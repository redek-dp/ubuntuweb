
# XFCE4 on Github Codespaces

Aqui estão os comandos com as correções aplicadas:

```bash
# 1. Atualizar o sistema
sudo apt update

# 2. Instalar os pacotes necessários
sudo apt install xfce4 xfce4-goodies novnc python3-websockify python3-numpy tightvncserver htop nano neofetch firefox -y

# 3. Gerar certificado SSL autoassinado (CORREÇÃO: -x509 em vez de -x500)
openssl req -x509 -nodes -newkey rsa:3072 -keyout novnc.pem -out novnc.pem -days 3650

# 4. Iniciar o VNC Server pela primeira vez (para criar arquivos de configuração)
USER=root vncserver

# 5. Matar a sessão VNC para reconfigurar
vncserver -kill :1

# 6. Fazer backup do xstartup original
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak

# 7. Criar/editar o novo xstartup
nano ~/.vnc/xstartup
```

**Conteúdo do arquivo `~/.vnc/xstartup`:**
```bash
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
```

```bash
# 8. Dar permissão de execução ao xstartup
chmod +x ~/.vnc/xstartup

# 9. Iniciar o VNC Server novamente
USER=root vncserver

# 10. Iniciar o noVNC via Websockify na porta 6080
websockify -D --web=/usr/share/novnc/ --cert=/home/ubuntu/novnc.pem 6080 localhost:5901
```

---


## ⚠️ Observações importantes:

1. **Caminho do certificado:** O comando `openssl` gera o `novnc.pem` no diretório atual (provavelmente `/root`), mas o `websockify` aponta para `/home/ubuntu/novnc.pem`. Ajuste conforme o usuário real:
   ```bash
   websockify -D --web=/usr/share/novnc/ --cert=/root/novnc.pem 6080 localhost:5901
   ```

2. **Porta do VNC:** O `websockify` conecta em `localhost:5901`, mas a primeira sessão VNC (`:1`) roda na porta **5901** — isso está correto. ✅

3. **Segurança:** Executar VNC e noVNC como `root` não é recomendado em produção. Considere usar um usuário comum.

4. **Para acessar:** Abra no navegador `https://SEU_IP:6080/vnc.html`

---

# Como Ligar o Servidor Novamente

## 💡 Dica: Script para reiniciar tudo limpo

```bash
#!/bin/bash
echo "Parando serviços..."
vncserver -kill :1 2>/dev/null
pkill -f websockify 2>/dev/null
sleep 2

echo "Iniciando VNC Server..."
USER=root vncserver :1

echo "Iniciando noVNC..."
websockify -D --web=/usr/share/novnc/ --cert=/root/novnc.pem 6080 localhost:5901

echo "Pronto! Acesse: https://SEU_IP:6080/vnc.html"
```

Salve como `~/restart-vnc.sh`, dê permissão com `chmod +x ~/restart-vnc.sh` e execute sempre que precisar reiniciar. ✅