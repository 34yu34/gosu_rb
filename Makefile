all:

dep:
	sudo apt-get install \
	libsdl2-dev \
	libsdl2-ttf-dev \
	libpango1.0-dev \
	libgl1-mesa-dev \
	libopenal-dev \
	libsndfile1-dev \
	libmpg123-dev \
	libgmp-dev \
	ruby
	bundle install
