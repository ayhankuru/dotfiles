function appveyortest
{
data="$(cat <<-EOF
init:
  - git config --global core.autocrlf true
environment:
  matrix:
    - nodejs_version: "1.6"
install:
  - ps: Install-Product node \$env:nodejs_version
  - npm install
build: off
test_script:
  - node --version
  - npm --version
  - npm run test
version: "{build}"
EOF
)" 
 command echo "$data" > appveyor.yml 
 command git add appveyor.yml
 command git commit -m "appveyor test added"
 command git u
 echo -e "${blue} Appveyor dosyası oluşturuldu ve gönderildi :)  ${reset}"
}