"%ProgramFiles%\Docker\Docker\DockerCli.exe" -SwitchLinuxEngine
docker pull openjdk:8-jdk-slim
docker build -t ci-andk -f ci-andk.dockerfile .
