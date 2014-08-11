# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Lesson.create(title:"Olá, mundo",content:

"<p> Vamos começar mostrando algumas mensagens na tela </p>
<p> Digite “Olá, mundo” no campo menor e, em seguida, clique no botão executar.
Não esqueça de colocar a frase entre aspas.</p>
<p>Observe o que acontece no campo superior</p>
<p>Agora, digite seu nome entre aspas e, mais uma vez, 
clique no botão para executar o código. Por  exemplo: “Fulano”</p>
<p>Você verá que, nos dois exemplos, as aspas desapareceram.
Isso ocorre porque, na linguagem Ruby, esses sinais (“  “) são um comando para imprimir 
mensagens na tela.
                                                                                                                                                           Essas mensagens são chamadas de Strings.</p>
                                                                                                                                                                                           <p>Quer saber o que é uma String?</p>")
Lesson.create(title:"2. Cálculos simples",content:

"<p> Fazer cálculos matemáticos em Ruby pode muito simples.</p>
<p>Experimente fazer uma conta, como se estivesse usando uma calculadora,
e veja o resultado. Por exemplo:</p>
<p>2+3</p>
<p>ou 167-35</p>
<p>ou 3/3</p>
<p>ou 12*16</p>

<p>Note que o sinal utilizado para divisão é '*' e o de multiplicação é '/'.
E como estamos lidando com números, não precisamos usar as aspas (" ").</p>")

Lesson.create(title:"3. Mais cálculos",content:

"<p>Você também pode combinar diferentes operações matemáticas num 
código só. Digite <b>2 + 5 * (3-1)/2</b>  e veja o que acontece.</p>
<p> A ordem de solução foi a seguinte: primeiro parênteses, 
depois multiplicação e divisão (na sequência em que aparecem) e 
soma e subtração.</p>
<p> É possível ainda calcular a potência de um número. Para obter o quadrado de 2, 
digita-se <b>2 ** 2</b></p>
<p>E para extrair a raiz quadrada, utiliza-se o método da classe Math:</p>
<p><b>Math.sqrt(9)</b></p>")


Lesson.create(title:"4. Variáveis",content:
"<p> Para organizar o seu código, deixando-o mais legível, você pode utilizar 
<b>variáveis</b>!</p>
<p>Você pode atribuir valores às variáveis. Digite o código abaixo e clique no botão
Executar:</p>

<p><b>nome = \"Seu nome\"</b></p>

<p>Neste caso, criamos uma variável chamada <b>nome</b>, que contem 
o valor \"Seu nome\".</p>

<p>Experimente criar outras variáveis e execute o código para ver o resultado.</p>")

Lesson.create(title:"Parabéns!!",content:
"<p> Você acaba de concluir seus primeiros passos em Ruby!</p>")

Lesson.create(title:"Aguarde novidades!!",content:
"<p> Em breve, teremos mais lições e um terminal decente! :D :D</p>")
