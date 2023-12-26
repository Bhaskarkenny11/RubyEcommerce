FROM ruby:3.1.2 AS rails-toolbox

# Default directory
# ENV INSTALL_PATH /opt/app
# RUN mkdir -p $INSTALL_PATH

# Install rails
RUN gem install rails bundler
#RUN chown -R user:user /opt/app
# WORKDIR /opt/app

RUN git clone https://github.com/Bhaskarkenny11/RubyEcommerce.git

RUN cd RubyEcommerce

RUN pwd


RUN bundle install

RUN rake db:migrate
RUN rails s
