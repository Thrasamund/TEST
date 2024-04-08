*** Settings ***
Library    Selenium2Library
Resource    commun.resource
# Test Setup    Effectuer Une Connexion Réussie
# Test Teardown    Fermer Le Navigateur


*** Test Cases ***
Tableau De Bord Visible Après Une Connexion Réussie
    [Setup]    Effectuer Une Connexion Réussie
    Vérifier La Redirection Sur Le Tableau De Bord
    [Teardown]    Fermer Le Navigateur


Lien de Connexion Visible Après Une Déconnexion Réussie
    [Setup]    Effectuer Une Connexion Réussie
    Vérifier La Redirection Sur Le Tableau De Bord
    Se Déconnecter
    Vérifier Que Le Lien De Connexion Est Visible
    [Teardown]    Fermer Le Navigateur

