# FROM ubuntu
FROM ubuntu:jammy

# -y to answer "Yes" to all promts

# "su -" - enables su-mode to install sudo

# "sudo -i" - login as "root"

RUN echo "Initializing Ubuntu..." && \
    su - && apt update && \
    \
    # Remove command line interactions
    DEBIAN_FRONTEND=noninteractive \
    \
    # Skips upgrades
    apt install --no-install-recommends -y \
    # apt install -y \
    #==========Packages==========#
    curl \
    #==========Packages==========#
    && \
    echo "..."

#==========Git==========#
# RUN echo "Installing Git..." && \
#     # Remove command line interactions
#     DEBIAN_FRONTEND=noninteractive \
#     apt install -y \
#     #=====Packages=====#
#     git \
#     #=====Packages=====#
#     && \
#     echo "..."
#==========Git==========#

#==========MySQL==========#
# RUN echo "Installing MySQL..." && \
#     # Remove command line interactions
#     DEBIAN_FRONTEND=noninteractive \
#     apt install -y \
#     #=====Packages=====#
#     mysql-server \
#     #=====Packages=====#
#     && \
#     usermod -d /var/lib/mysql/ mysql && service mysql start; \
#     echo "..."
# EXPOSE 3306/tcp
# EXPOSE 33060/tcp
#==========Git==========#

# #==========Apache==========#
# RUN echo "Installing Apache..." && \
#     # Remove command line interactions
#     DEBIAN_FRONTEND=noninteractive \
#     apt install -y \
#     #=====Packages=====#
#     apache2 \
#     #=====Packages=====#
#     && \
#     echo "..."
# #==========Apache==========#

# #==========Nginx==========#
# RUN echo "Installing Nginx..." && \
#     # Remove command line interactions
#     DEBIAN_FRONTEND=noninteractive \
#     apt install -y \
#     #=====Packages=====#
#     nginx \
#     #=====Packages=====#
#     && \
#     echo "..."
# #==========Nginx==========#

# #==========Install PHP & PHP Extensions==========#
# RUN echo "Installing PHP..." && \
#     # Needed to install latest PHP versions
#     add-apt-repository ppa:ondrej/php && \
#     \
#     # Remove command line interactions
#     DEBIAN_FRONTEND=noninteractive \
#     apt install -y \
#     #=====Packages=====#
#     php8.1 \
#     php8.1-fpm \
#     #=====Packages=====#
#     && \
#     echo "..."
# #==========Install PHP & PHP Extensions==========#

# #==========Java==========#
# RUN echo "Installing Java..." && \
#     # Remove command line interactions
#     DEBIAN_FRONTEND=noninteractive \
#     apt install -y \
#     #=====Packages=====#
#     openjdk-21 \
#     #=====Packages=====#
#     && \
#     echo "..."
# #==========Java==========#

# # Jenkins needs Java to run and Git to pull repositories. Install Git first
# RUN echo "Installing Jenkins..." && \
#     curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null && \
#     echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null && \
#     apt update && \
#     apt install -y \
#     #==========Jenkins==========#
#     jenkins \
#     #==========Jenkins==========#
#     && \
#     echo "..."

# #==========NVM/Node.js==========#
# ENV NODE_VERSION 17.7.0
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash;
# RUN \
#     #=====OPTION 1=====#
#     # NVM_DIR=~/.nvm \
#     # && \
#     # . $NVM_DIR/nvm.sh; \
#     #=====OPTION 1=====#
#     \
#     #=====OPTION 2=====#
#     # . ~/.bashrc; \
#     #=====OPTION 2=====#
#     \
#     #=====OPTION 3=====#
#     export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")";\
#     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";\
#     #=====OPTION 3=====#
#     nvm install $NODE_VERSION;
# ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
# ENV PATH $NVM_DIR:$NVM_DIR/v$NODE_VERSION/node_modules/npm/bin:$PATH
# ENV NVM_HOME $NVM_DIR
# #==========NVM/Node.js==========#

#==========NVM/Node.js==========#

# If NODE_VERSION environment variable is present/set, NVM automatically detects it and will proceed to download the version,
# else, you need to run the ff:
#     export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")";\
#     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";
#     nvm install node;

RUN echo "Installing NVM & Node.js..."; \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash; \
    . ~/.bashrc \
    nvm install --lts; \
    nvm use --lts; \
    npm install -g pnpm; \
    && \
    echo "..."
#==========NVM/Node.js==========#

# Start services
CMD \
    #=====Start PostgreSQL=====#
    # service postgresql start \
    # && \
    #=====Start PostgreSQL=====#
    \
    #=====Start MySQL=====#
    # usermod -d /var/lib/mysql/ mysql && service mysql start \
    # && \
    #=====Start MySQL=====#
    \
    #=====Start PHP=====#
    # service php8.1-fpm start \
    # && \
    #=====Start PHP=====#
    \
    #=====Start Apache=====#
    # service apache2 start \
    # && \
    #=====Start Apache=====#
    \
    #=====Start Nginx=====#
    # nginx -g "daemon off;" \
    # && \
    #=====Start Nginx=====#
    \
    #=====Start Jenkins=====#
    # jenkins \
    # && \
    #=====Start Jenkins=====#
    \
    #=====Keep Container Running=====#
    # . ~/.bashrc \
    # && \
    # pnpm install \
    # && \
    # pnpm buiild \
    # && \
    # pnpm start \
    # && \
    sleep infinity