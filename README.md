<img src="icon.png" min-width="150px" max-width="150px" width="150px" align="right" alt="">

# UBUNTU-WEB.

XUBUNTU XFCE DESKTOP WEB BROWSER ACESSÍVEL DOCKER IMAGE. APLICATIVO BY DEVELOPER DAVIDSONBPE...

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

--------

### DOAR COM

[![DOAR COM](https://img.shields.io/badge/PagBank-1bb99a?style=for-the-badge&logo=PagBank&logoColor=white)](https://pag.ae/7Y3uUnhg8)

--------

<br />

## CONECTE-SE COM NÓS:

[<img height="30" src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" alt="davidsonbpe | YouTube" />][youtube]
[<img height="30" src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white" alt="davidsonbpe | Instagram" />][instagram]
[<img height="30" src="https://img.shields.io/badge/CodePen-003333?style=for-the-badge&logo=CodePen&logoColor=white" alt="davidsonbpe | CodePen" />][CodePen]
[<img height="30" src="https://img.shields.io/badge/Facebook-1877F2?style=for-the-badge&logo=facebook&logoColor=white" alt="davidsonbpe | Facebook" />][facebook]
<a href="mailto:dev7.capital366@passinbox.com" alt="Email">
<img height="30" src="https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=Minutemailer&logoColor=white" /></a>
<a href="https://br.pinterest.com/davidsonbpe/" alt="Pinterest">
<img height="30" src="https://img.shields.io/badge/Pinterest-FF0000?style=for-the-badge&logo=Pinterest&logoColor=white" /></a>

<br />

<a href="https://dav7.pages.dev/" align="right" alt="Visitor count">
<img height="30" src="https://raw.githubusercontent.com/davserv/d-framework/refs/heads/img-iso/count.svg" /></a>

<br />


<img src="https://devanalytics.vercel.app/p/m8voKzwna" min-width="1px" max-width="1px" width="1px">

[youtube]: https://www.youtube.com/channel/UCHqvw9v2Fp6o006lUskoigg/
[instagram]: https://www.instagram.com/davidsonbpe/
[facebook]: https://www.facebook.com/decomrradio/
[CodePen]: https://codepen.io/davidsonbpe/