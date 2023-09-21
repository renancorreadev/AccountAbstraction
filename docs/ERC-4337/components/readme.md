# Componentes da Abstração de Conta

Os Componentes da Abstração de Conta consistem em vários elementos-chave que juntos formam o protocolo de Abstração de Conta ERC-4337. Este protocolo visa melhorar a experiência do usuário e a flexibilidade ao interagir com a rede Ethereum. Vamos dar uma olhada mais detalhada em cada componente:

## UserOperation (Operação do Usuário)

Esta é um objeto de pseudo-transação introduzido pelo ERC-4337. Ele captura a intenção do usuário de interagir com o blockchain. A UserOperation não é um tipo de transação regular, mas sim uma representação do que o usuário deseja fazer. É usada para executar ações por meio de uma conta de contrato inteligente. Este objeto passa por duas fases: verificação e execução. A verificação verifica a validade das Operações do Usuário, e a execução lida com a execução real das transações.

## Wallet (Conta)

Uma carteira, ou conta, representa o usuário na blockchain. Pode ser uma Conta de Propriedade Externa (EOA) controlada por chaves privadas ou uma Conta de Contrato (CA) que é um contrato inteligente com código executável.

## Wallet Contract (contrato da Wallet)

Este é um contrato inteligente que representa uma conta de usuário. Ele pode oferecer mais funcionalidades a um usuário do que uma carteira baseada em EOA devido à sua programabilidade.

## Wallet deployer (Gerador de carteiras)

Este é um contrato (singleton) que cria um contrato de carteira. O criador de carteira é responsável por gerar e gerenciar carteiras de contrato inteligente em nome dos usuários.

## Wallet Software (software de wallet)

Este é a interface do usuário (UX) que permite aos usuários assinar e enviar a Operação do Usuário para os nós. É essencialmente o software que interage com a blockchain em nome do usuário.

## Paymasters (Patrocinadores) GassLess (sem taxas)

Os patrocinadores são contratos inteligentes que podem patrocinar taxas de transação para os usuários. Eles podem avaliar se aceitam uma Operação do Usuário durante a fase de verificação e implementar qualquer lógica de taxa necessária durante a fase de execução. Isso permite que os usuários paguem as taxas em tokens ERC-20, como stablecoins em dólares, ou não paguem nada se um terceiro, como um provedor de carteira fintech, estiver disposto a cobri-las.

## Bundlers (Agrupadores)

Os agrupadores são uma classe especializada de atores que monitoram o Mempool de Operações do Usuário, executam simulações e montam um conjunto de Operações do Usuário em um único pacote de transação. Eles são responsáveis por coletar Operações do Usuário e enviá-las ao contrato EntryPoint, otimizando o uso de gás e maximizando o lucro por meio da lógica de priorização de taxas.

## EntryPoint (Ponto de Entrada)

EntryPoint é um contrato que recebe o conjunto agrupado de Operações do Usuário. Ele atua como um coordenador central para gerenciar Operações do Usuário dentro do fluxo de transação ERC-4337. Ele interage com um contrato de Patrocinador, se especificado pela Operação do Usuário, verifica se o Patrocinador tem um depósito suficiente ou se a Conta de Contrato possui fundos suficientes para cobrir as taxas de gás e, em seguida, chama a Conta de Contrato e, se necessário, o Patrocinador, para validar as assinaturas na Operação do Usuário.


