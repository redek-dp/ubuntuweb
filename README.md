<img src="https://raw.githubusercontent.com/redek-dp/ubuntuweb/main/icon.png" min-width="150px" max-width="150px" width="150px" align="right" alt="">

# UBUNTU-WEB.

UBUNTU 24.04 XFCE DESKTOP WEB BROWSER ACESSÍVEL DOCKER IMAGE. APLICATIVO BY DEVELOPER DAVIDSONBPE...

----------


### GIT CLONE 

```bash
git clone https://github.com/redek-dp/ubuntuweb.git
```

--------

### CD LOCAL PASTA

```bash
cd ubuntuweb
```

--------

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
![screenshot](https://raw.githubusercontent.com/redek-dp/ubuntuweb/main/screenshot.jpg)

--------

## Como executar

1. Abra um terminal na pasta do projeto:
   ```bash
   cd ubuntuweb
   ```

2. Construa a imagem Docker:
   ```bash
   docker build -t ubuntu-vnc .
   ```

3. Execute o container:
   ```bash
   docker run -d \ --name ubuntu-vnc \ -p 5901:5901 \ -p 6080:6080 \ ubuntu-vnc
   ```

## Como acessar

- Acesso web VNC: `http://localhost:6080/vnc.html`
- VNC direto: `localhost:5901`

## Observação

- Esse Dockerfile usa `vncserver` sem senha (`-SecurityTypes None`), então não é seguro para uso em produção.
- Se você precisar usar `sudo` para Docker, adicione antes dos comandos:

  ```bash
  sudo docker build -t ubuntu-vnc .
  sudo docker run -d \ --name ubuntu-vnc \ -p 5901:5901 \ -p 6080:6080 \ ubuntu-vnc
  ```

Se quiser, posso também te ajudar a rodar só a interface web (`noVNC`) ou a ajustar uma senha VNC.

--------

### DOAR COM

[![DOAR COM](https://img.shields.io/badge/DOAR%20COM-PagBank-295.svg?logo=pagseguro&style=for-the-badge&logoColor=f5f5f5)](https://pag.ae/7Y3uUnhg8)

--------

### CONECTE-SE COM NÓS:

[<img height="30" src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" alt="davidsonbpe | YouTube" />][youtube]
[<img height="30" src="https://img.shields.io/badge/DAV7.STORE-555?style=for-the-badge&logo=cloudways&logoColor=white" alt="DAV7.STORE" />][dav7]
[<img height="30" src="https://img.shields.io/badge/davidsonbpe-666?style=for-the-badge&logo=dash&logoColor=fff" alt="davidsonbpe" />][davidsonbpe]
[<img height="30" src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white" alt="davidsonbpe | Instagram" />][instagram]
[<img height="30" src="https://img.shields.io/badge/CodePen-003333?style=for-the-badge&logo=c&logoColor=white" alt="davidsonbpe | CodePen" />][CodePen]
[<img height="30" src="https://img.shields.io/badge/Facebook-1877F2?style=for-the-badge&logo=facebook&logoColor=white" alt="davidsonbpe | Facebook" />][facebook]
[<img height="30" src="https://img.shields.io/badge/GitHub-003333?style=for-the-badge&logo=github&logoColor=white" alt="davidsonbpe | GitHub" />][github]
[<img height="30" src="https://img.shields.io/badge/huggingface-6C55C1?style=for-the-badge&logo=huggingface&logoColor=75CB22" alt="Kexel | HuggingFace" />][huggingface]
[<img height="30" src="https://img.shields.io/badge/stackblitz-A89BDA?style=for-the-badge&logo=stackblitz&logoColor=fff" alt="StackBlitz" />][stackblitz]
[<img height="30" src="https://img.shields.io/badge/Pinterest-C2464B?style=for-the-badge&logo=Pinterest&logoColor=white" alt="Pinterest" />][pinterest]
[<img height="30" src="https://img.shields.io/badge/Twitter-222?style=for-the-badge&logo=x&logoColor=white" alt="davidsonbpe | Twitter" />][twitter]
<a href="mailto:dev7.capital366@passinbox.com" alt="Email">
<img height="30" src="https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=Minutemailer&logoColor=white" /></a>

<br />

<a href="https://dav7.pages.dev/" align="right" alt="Visitor count">
<img height="30" src="https://raw.githubusercontent.com/davserv/d-framework/refs/heads/img-iso/count.svg" /></a>

<br />

[dav7]: https://dav7.pages.dev/
[davidsonbpe]: https://davidsonbpe.blogspot.com/
[youtube]: https://www.youtube.com/channel/UCHqvw9v2Fp6o006lUskoigg/
[instagram]: https://www.instagram.com/davidsonbpe/
[facebook]: https://www.facebook.com/decomrradio/
[CodePen]: https://codepen.io/davidsonbpe/
[github]: https://github.com/davidsonbpe/
[huggingface]: https://huggingface.co/kexel
[stackblitz]: https://stackblitz.com/@redek-dp
[pinterest]: https://br.pinterest.com/davidsonbpe/
[twitter]: https://twitter.com/davidsonbpe
