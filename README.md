<div align="center">
  <img src="https://i.imgur.com/0RF4E1h.png" alt="create world">
</div>

<br />

## Description 📚
Project to simplify creation of Minecraft Servers

## Requirements ⚙️

- [Docker](https://www.docker.com/)

## How to run 🏃‍♂️

Build image

`docker build -t minecraft-server .`

Run docker container

`docker run -i -t -p=25565:25565 minecraft-server`

Join the world via direct connection with the addess: `<your-ip>:25565`

*if your're running it locally, you can use 127.0.0.1 as your IP*
