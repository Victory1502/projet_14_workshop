cmake_minimum_required(VERSION 3.10)
project(MagicBox)

# Définir le standard C++
set(CMAKE_CXX_STANDARD 11)

# Ajouter l'exécutable
add_executable(magicbox src/main.cpp)

# Si tu as des headers
include_directories(include)