FROM python:3.9

RUN apt update
RUN apt install sqlite3 sudo vim tig htop zsh wget curl -y

RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install virtualenv

# You may need to change this to YOUR gid and uid. The following is a common setup.
RUN adduser --disabled-password --gecos '' --uid 1000 --gid 1000 app
#RUN adduser --disabled-password --gecos '' --uid 1000 --gid 100 app

RUN chsh -s /usr/bin/zsh app

RUN sudo -u app sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

WORKDIR /work

COPY . .
RUN sudo -u app cp /work/.user-zshrc /home/app/.zshrc

# We want to load the .venv/bin/activate any time we run a shell
RUN echo 'source /work/.venv/bin/activate' >> /home/app/.zshrc

#Make sure to expose any ports your code needs here
#EXPOSE 8000
CMD [ "sudo", "-u", "app", "/work/bin/runner" ]
