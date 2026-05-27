<img src="icon.png" min-width="150px" max-width="150px" width="150px" align="right" alt="">

# UBUNTU-WEB.

UBUNTU DESKTOP WEB BROWSER ACCESSIBLE DOCKER IMAGE. APLICATIVO BY DEVELOPER DAVIDSONBPE...

----------


### INSTALL - LINUX / MACOS / WSL2

```bash
curl -fsSL https://raw.githubusercontent.com/redek-dp/ubuntuweb/main/install.sh | bash
```
--------

### COMANDO INSTALL

```bash
chmod +x install.sh && ./install.sh
```
--------

## ScreenShot
![screenshot](screenshot.png)

--------

## Como executar

1. Abra um terminal na pasta do projeto:
   ```bash
   cd /workspaces/ubuntuweb
   ```

2. Construa a imagem Docker:
   ```bash
   docker build -t ubuntuweb .
   ```

3. Execute o container:
   ```bash
   docker run -d --name ubuntuweb -p 6080:6080 -p 5901:5901 ubuntuweb
   ```

## Como acessar

- Acesso web VNC: `http://localhost:6080/vnc.html`
- VNC direto: `localhost:5901`

## Observação

- Esse Dockerfile usa `vncserver` sem senha (`-SecurityTypes None`), então não é seguro para uso em produção.
- Se você precisar usar `sudo` para Docker, adicione antes dos comandos:
  ```bash
  sudo docker build -t ubuntuweb .
  sudo docker run -d --name ubuntuweb -p 6080:6080 -p 5901:5901 ubuntuweb
  ```

Se quiser, posso também te ajudar a rodar só a interface web (`noVNC`) ou a ajustar uma senha VNC.