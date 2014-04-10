Omniauth Coursera
================= 

[![Gem Version](https://badge.fury.io/rb/omniauth-coursera.svg)](http://badge.fury.io/rb/omniauth-coursera)

## Basic Usage

    use OmniAuth::Builder do
      provider :coursera, ENV['COURSERA_KEY'], ENV['COURSERA_SECRET']
    end
