# initialiser terraform 
terraform init
# appliquer les changements
terraform apply


# executer le playbook
ansible-playbook -i inventory.ini playbook.yml


# Construire l'image 
 docker build -t my-web-app .

 # Exécuter avec Ansible 
  ansible-playbook -i inventory.ini deploy-docker.yml


  # lien Github https://github.com/chay31/devops_project