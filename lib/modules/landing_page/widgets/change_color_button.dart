import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:microblogging/widgets/button.dart';

class ChangeColorButton extends StatefulWidget {
  @override
  _ChangeColorButtonState createState() => _ChangeColorButtonState();
}

class _ChangeColorButtonState extends State<ChangeColorButton> {
  bool isCopied = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Button(
          isCopied ? "S.of(context).COPIADO " : "S.of(context).COPIAR", () {
        Clipboard.setData(
          ClipboardData(text: ee),
        );
        setState(() {
          isCopied = !isCopied;
        });
      }),
    );
  }

  String ee = "function doGet(e){"
      "try{\n"
      "var sheet = SpreadsheetAp\np.ge\ntAc\ntiveSheet();"
      "var lastRow = sheet.getLastRow();"
      "var lastColum = sheet.getLastColumn();"
      "var originalData = sheet.getRange(2,1,lastRow-1,lastColum).getValues();"
      "}catch(exc){"
      " console.log('Somenthing went wrong');  "
      "}"
      "var JSONString = JSON.stringify(originalData);"
      "var JSONOutput = ContentService.createTextOutput(JSONString);"
      "JSONOutput.setMimeType(ContentService.MimeType.JSON);"
      "return JSONOutput"
      "}";
}

// function doPost(request){
//   var result;

//   if(request.parameter.action=="save"){
//     result= save(request);
// }
//   else if(request.parameter.action=="edit"){
//    result= edit(request);
// }
//   else if(request.parameter.action=="config"){
//    result= createInitialConfig(request);
// }

//   return ContentService
//   .createTextOutput(JSON.stringify({"status": "SUCCESS"}))
//   .setMimeType(ContentService.MimeType.JSON);
// }

// function save(request){
//   var sheet = SpreadsheetApp.getActiveSheet();
//   var result = {"status": "SUCCESS"};

//   sheet.setConditionalFormatRules
//   try{
//     var data = request.parameter.data;
//     var categoria = request.parameter.categoria;
//     var oQue = request.parameter.oQue;
//     var como = request.parameter.como;
//     var prioridade = request.parameter.prioridade;
//     var prazo = request.parameter.prazo;
//     var status = request.parameter.status;
//     var feedBack = request.parameter.feedBack;
//     var obs = request.parameter.obs;
//   sheet.appendRow([data, categoria, oQue, como,prioridade,prazo,status,feedBack,obs]);

//   }catch(exc){
//     result = {"status": "FAILED", "message": exc};
//   }
//   return result;

// }

// function edit(request){
//     var sheet = SpreadsheetApp.getActiveSheet();
//     var result = {"status": "SUCCESS"};
//   try{
//     var row = request.parameter.rowToEdit;
//     var data = request.parameter.data;
//     var categoria = request.parameter.categoria;
//     var oQue = request.parameter.oQue;
//     var como = request.parameter.como;
//     var prioridade = request.parameter.prioridade;
//     var prazo = request.parameter.prazo;
//     var status = request.parameter.status;
//     var feeBack = request.parameter.feeBack;
//     var obs = request.parameter.obs;

//     sheet.getRange(row,1,1,9).setValues([[data, categoria,oQue,como,prioridade,prazo,status,feeBack,obs]]);

//   }catch(exc){
//     result = {"status": "FAILED", "message": exc ,
//    };
//   }
//   return result;
// }

// function createInitialConfig(request){
//   var result = {"status": "SUCCESS"};
//   var sheet = SpreadsheetApp.getActiveSheet();

//   sheet.insertRowBefore(1).getRange(1, 1, 1, 9).setValues([["CRIAÇÂO", "CATEGORIA", "O QUE ?", "COMO ?","PRIORIDADE","PRAZO","STATUS","FEED BACK","OBS"]]);
//   // sheet.appendRow();
//   sheet.appendRow(["28/12/2020", "EMPREGO", "Curriculo", "Fazer curriculo com ajuda de pedro e com manual do email de pedro","A","06/10/2021","EM PROGRESSO","TESTE","TESTE"]);

//   sheet.getRange("A1:I1").setFontWeight("bold").setBackground("#4a86e8").setFontColor("#ffffff").setHorizontalAlignment("center");
//   sheet.setColumnWidth(4,320);
//   sheet.setColumnWidth(5,50);
//   sheet.setColumnWidth(7,120);

//   sheet.getRange("A1:I100").setBorder(true, true, true, true, true, true).setVerticalAlignment("middle");
//   sheet.getRange("A:A").setHorizontalAlignment("center");
//   sheet.getRange("B:B").setHorizontalAlignment("center");
//   sheet.getRange("C:C").setHorizontalAlignment("center");
//   sheet.getRange("E:E").setHorizontalAlignment("center");
//   sheet.getRange("F:F").setHorizontalAlignment("center");
//   sheet.getRange("G:G").setHorizontalAlignment("center");

//   sheet.setRowHeights(1, 100, 40);

//   var rule = SpreadsheetApp.newConditionalFormatRule()
//     .whenTextContains("EM PROGRESSO")
//     .setBackground("#ffff00")
//     .setBold(true)
//     .setFontColor("#434343")
//     .setRanges([sheet.getRange("G:G")])
//     .build();
//   var rule1 = SpreadsheetApp.newConditionalFormatRule()
//     .whenTextContains("ATRASADA")
//     .setBackground("#fb1744")
//     .setBold(true)
//     .setFontColor("#ffffff")
//     .setRanges([sheet.getRange("G:G")])
//     .build();

//   var rule2 = SpreadsheetApp.newConditionalFormatRule()
//     .whenTextContains("CANCELADA")
//     .setBackground("#efefef")
//     .setBold(true)
//     .setRanges([sheet.getRange("G:G")])
//     .build();
//   var rule3 = SpreadsheetApp.newConditionalFormatRule()
//     .whenTextContains("COMPLETA")
//     .setBackground("#69f0ae")
//     .setBold(true)
//     .setFontColor("#666666")
//     .setRanges([sheet.getRange("G:G")])
//     .build();
//   var rule4 = SpreadsheetApp.newConditionalFormatRule()
//     .whenTextContains("EM ESPERA")
//     .setBackground("#d9d9d9")
//     .setBold(true)
//     .setRanges([sheet.getRange("G:G")])
//     .build();

//   var rule5 = SpreadsheetApp.newConditionalFormatRule()
//     .whenDateAfter(SpreadsheetApp.RelativeDate.TODAY)
//     .setBackground("#69f0ae")
//     .setBold(true)
//     .setRanges([sheet.getRange("F:F")])
//     .build();

//   var rule6 = SpreadsheetApp.newConditionalFormatRule()
//     .whenDateBefore(SpreadsheetApp.RelativeDate.TODAY)
//     .setBackground("#fb1744")
//     .setBold(true)
//     .setFontColor("#ffffff")
//     .setRanges([sheet.getRange("F:F")])
//     .build();

//   var rule7 = SpreadsheetApp.newConditionalFormatRule()
//     .whenDateEqualTo(SpreadsheetApp.RelativeDate.TODAY)
//     .setBackground("#ffff00")
//     .setBold(true)
//     .setRanges([sheet.getRange("F:F")])
//     .build();

//   var rule8 = SpreadsheetApp.newConditionalFormatRule()
//     .whenTextEqualTo("A")
//     .setBackground("#fb1744")
//     .setBold(true)
//     .setFontColor("#ffffff")
//     .setRanges([sheet.getRange("E:E")])
//     .build();

//   var rules = sheet.getConditionalFormatRules();
//     rules.push(rule);
//     rules.push(rule1);
//     rules.push(rule2);
//     rules.push(rule3);
//     rules.push(rule4);
//     rules.push(rule5);
//     rules.push(rule6);
//     rules.push(rule7);
//     rules.push(rule8);
//   sheet.setConditionalFormatRules(rules);

//   return result;
// }
// }
