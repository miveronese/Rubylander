# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Lesson.create(title:"Olá, mundo",content:"<p> Vamos começar mostrando algumas mensagens na tela </p>
                                          <p> Digite “Olá, mundo” no campo menor e, em seguida, clique no botão executar.
                        Não esqueça de colocar a frase entre aspas.</p>
<p>Observe o que acontece no campo superior</p>
                     <p>Agora, digite seu nome entre aspas e, mais uma vez, clique no botão para executar o código. Por  exemplo: “Fulano”</p>
<p>Você verá que, nos dois exemplos, as aspas desapareceram.
                                                  Isso ocorre porque, na linguagem Ruby, esses sinais (“  “) são um comando para imprimir mensagens na tela.
                                                                                                                                                           Essas mensagens são chamadas de Strings.</p>
                                                                                                                                                                                           <p>Quer saber o que é uma String?</p>")
Lesson.create(title:"Calculos",content:"<p>Aqui você irá aprender os conceitos básicos </br>da linguagem Ruby. Vai descobrir
                        como executar </br>um código e a maneira correta de declarar variáveis,
                        escrever <i>arrays</i>, laços e funções.
                     </p>
                     <p>Não entendeu o que significam essas expressões? Não tem problema! Este tutorial
                        também foi criado pensando em quem ainda não tem noções </br>de programação e quer programar em Ruby.</p>
                     <p>Vamos começar? Clique no botão avançar para ir para a primeira lição.</p>")
