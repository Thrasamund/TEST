*** Settings ***
Library    Selenium2Library


*** Variables ***
${X} =    3
${URL} =    http://livraison${X}.testacademy.fr/
${NAV} =    chrome
${LIEN SE CONNECTER} =     xpath=//a[contains(text(),'Se connecter')]
${CHAMP NOM D'UTILISATEUR} =   name=username
${CHAMP MOT DE PASSE} =     name=password
${NOM VALIDE} =     robot
${MDP VALIDE} =    robot
${BOUTON SE CONNECTER} =    css=.homey_login_button
${TEXTE} =    Tableau de bord
${BOUTON SE DECONNECTER} =    xpath=(//a[contains(text(),'Se déconnecter')])[3]
${ZONE D'ERREUR} =    css=#modal-login .error


*** Keywords ***
Effectuer Une Connexion Réussie
    Ouvrir le Navigateur Et Accéder A L'Application
    Accéder A La Pop-up De Connexion
    Entrer Le Nom D'Utilisateur    ${NOM VALIDE}
    Entrer Le Mot De Passe    ${MDP VALIDE}
    Valider La Connexion

Ouvrir le Navigateur Et Accéder A L'Application
    Open Browser    ${URL}   ${NAV}
    Maximize Browser Window

Accéder A La Pop-up De Connexion
    Click Element    ${LIEN SE CONNECTER}
    Wait Until Element Is Visible    ${CHAMP NOM D'UTILISATEUR}

Entrer Le Nom D'Utilisateur
    [Arguments]    ${nom}
    Input Text    ${CHAMP NOM D'UTILISATEUR}    ${nom}

Entrer Le Mot De Passe
    [Arguments]    ${mdp}
    Input Text    ${CHAMP MOT DE PASSE}    ${mdp}

Valider La Connexion
    Click Element    ${BOUTON SE CONNECTER}

Vérifier La Redirection Sur Le Tableau De Bord
    Wait Until Element Is Not Visible    ${CHAMP NOM D'UTILISATEUR}
    Page Should Contain    ${TEXTE}

Fermer Le Navigateur 
    Close Browser

Se Déconnecter
	Wait Until Element Is Visible	${BOUTON SE DECONNECTER}
    Click Element    ${BOUTON SE DECONNECTER}

Vérifier Que Le Lien De Connexion Est Visible
    Wait Until Element Is Visible    ${LIEN SE CONNECTER}

Vérifier Que Le Message D'Erreur Est Visible
    Wait Until Element Is Visible    ${ZONE D'ERREUR}
    Element Text Should Not Be    ${ZONE D'ERREUR}    ${EMPTY}

