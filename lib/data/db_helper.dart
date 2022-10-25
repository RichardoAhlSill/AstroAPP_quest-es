import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "banco_attt.db");
    Database database =
        await openDatabase(path, version: 1, onCreate: onCreate);

    print(path);
    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {

    String sql =
        "CREATE TABLE user (username varchar(100) PRIMARY KEY, password varchar(100))";
    await db.execute(sql);

    sql =
        "INSERT INTO user (username, password) VALUES ('astronauta@gmail.com', '40028922')";
    await db.execute(sql);

    //BANCO_QUESTOES
    String sqlquestion =
        "CREATE TABLE QUESTOES (imagem varchar(100), titulo varchar(400), alternativa1 varchar(100), alternativa2 varchar(100), alternativa3 varchar(100), alternativa4 varchar(100), alternativa5 varchar(100), alternativa_certa number);";
    await db.execute(sqlquestion);

    sqlquestion =
        "INSERT INTO QUESTOES (imagem, titulo, alternativa1, alternativa2, alternativa3, alternativa4, alternativa5, alternativa_certa) VALUES ('https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Size_planets_comparison.jpg/1280px-Size_planets_comparison.jpg', 'Vivemos no planeta Terra. Além dele, existem outros sete girando em torno do Sol, cujos nomes esperamos que já saiba. Então, responda: Quantos planetas têm somente 5 letras em seu nome? Assinale a única alternativa correta.', '4', '3', '2', '5', '6', 1);";
    await db.execute(sqlquestion);

    sqlquestion =
        "INSERT INTO QUESTOES (imagem, titulo, alternativa1, alternativa2, alternativa3, alternativa4, alternativa5, alternativa_certa) VALUES ('https://1.bp.blogspot.com/-g0sTX70IkYE/XqMWxgrVPqI/AAAAAAAAdS4/3GW2FyrxmA4at_WzndS3Q9SD-yFGsFAbACLcBGAsYHQ/s1600/dia-e-noite-003.jpg', 'Tudo no Universo se move. O que explica a alternância entre a noite e o dia claro? Assinale a única alternativa correta. ', 'À noite a Terra entra na sombra da Lua.', 'A rotação do Sol.', 'A rotação da Terra.', 'À noite o Sol não brilha', 'À noite um Buraco Negro bloqueia a luz do Sol. ', 3);";
    await db.execute(sqlquestion);

    sqlquestion =
        "INSERT INTO QUESTOES (imagem, titulo, alternativa1, alternativa2, alternativa3, alternativa4, alternativa5, alternativa_certa) VALUES ('https://www.eusemfronteiras.com.br/wp-content/uploads/2020/02/81863403_s-810x519.jpg', 'Vamos fazer uma viagem espacial. Vamos começar indo para o mesmo local onde foram os astronautas, em 1969. Qual é o nome deste lugar? Uma dica: este lugar fica “pertinho”, ou seja, só cerca de 400.000 quilômetros. Assinale a única alternativa correta.', 'Plutão', 'Urano', 'Marte', 'Vênus', 'Lua', 5);";
    await db.execute(sqlquestion);


  }
}