FROM quay.io/fossa/fossa-cli

# install NuGet (with mono)
# https://docs.microsoft.com/en-us/nuget/install-nuget-client-tools#macoslinux
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF &&\
    echo "deb https://download.mono-project.com/repo/ubuntu stable-xenial main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list &&\
    apt-get update &&\ 
    apt-get install -y mono-complete &&\
    curl -o /usr/local/bin/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe &&\
    echo "alias nuget=\"mono /usr/local/bin/nuget.exe\"" >> ~/.bash_aliases

# Set the environment variable?