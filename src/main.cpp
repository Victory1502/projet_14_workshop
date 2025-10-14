#include <iostream>
#include <cstdlib>
#include <string>

int main() {
    std::cout << "=== Boîte Magique de Serverus ===" << std::endl;
    
    // Initialiser git si nécessaire
    system("git init");
    
    // Ajouter tous les fichiers
    system("git add .");
    
    // Créer un commit
    std::cout << "Message du commit: ";
    std::string message;
    std::getline(std::cin, message);
    
    std::string commit_cmd = "git commit -m \"" + message + "\"";
    system(commit_cmd.c_str());
    
    // Push vers GitHub
    system("git push origin main");
    
    std::cout << "Fichiers envoyés vers GitHub!" << std::endl;
    
    return 0;
}