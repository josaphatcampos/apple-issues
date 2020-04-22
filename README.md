# Apple Issues

Projeto em **Swift** com arquitetura **MVP**.

## Detalhamento
#### Uma tela com a lista de issues do repositório (https://api.github.com/repos/apple/swift/issues) . Com os seguintes elementos:
- Título do issue
- Estado do issue (ABERTO, FECHADO)

#### Uma tela mostrando os detalhes do issue que foi selecionado na lista. Com os seguintes elementos:
- Título do issue
- Texto de Descrição do issue
- Avatar do usuário que criou a issue
- Data de criação
- Um botão que abre o browser com o link issue do site do github

## Recursos

 - Consulta em API - **Alamofire**
 - Exibir imagens através de suas URLs com loading - **Kingfisher**
 - Paginação Infinita - *(Infinite Scroll)*
 - UnityTests com Quick/Nimble

## Instalando o CocoaPods

Para o download das dependências você deve instalar o CocoaPods

[CocoaPods](http://cocoapods.org/) é um gerenciador de dependência. Você pode instalá-lo com o seguinte comando:

    $ gem install cocoapods
Depois de instalado, dentro da pasta do repositório, execute o seguinte comando:

    $ pod install
Depois você deve abrir o projeto através do `Apple Issues.xcworkspace` que estará na pasta do repositório
