/*
  auth:LiMeixin
  function:js导出Excel
  date:11.6 2015
*/
    function saveAsExcel(tableID) {
	   var tb = new TableToExcel(tableID);
	   tb.setFontStyle("Courier New");
	   //change point 1: start
	   tb.setFontSize(11);
	   tb.setTableBorder(2);
	   tb.setColumnWidth(20);
	   tb.setRowHeight(25);
	   tb.setBackGround(-1);
	   //change point 1: end
	   tb.isLineWrap(true);
	   tb.getExcelFile();
    }

   function TableToExcel(tableID) {
	   this.tableBorder = 2; //边框类型，-1没有边框 可取1/2/3/4
	   this.backGround = 2; //背景颜色：白色 可取调色板中的颜色编号 1/2/3/4....
	   this.fontColor = 1; //字体颜色：黑色
	   this.fontSize = 20; //字体大小
	   this.fontStyle = "宋体"; //字体类型
	   this.rowHeight = -1; //行高
	   this.columnWidth = -1; //列宽
	   this.lineWrap = true; //是否自动换行
	   this.textAlign = -4131; //内容对齐方式 左对齐
	   //this.textAlign = "left";     ?xlRight -4152 ?xlLeft -4131 ?xlCenter -4108 
	   this.autoFit = false; //是否自适应宽度
	   this.tableID = tableID;
   }
 
 
   TableToExcel.prototype.setTableBorder = function (excelBorder) {
	   this.tableBorder = excelBorder;
   };
   
   TableToExcel.prototype.setBackGround = function (excelColor) {
	   this.backGround = excelColor;
   };
   
   TableToExcel.prototype.setFontColor = function (excelColor) {
	   this.fontColor = excelColor;
   };
   
   TableToExcel.prototype.setFontSize = function (excelFontSize) {
	   this.fontSize = excelFontSize;
   };
   
   TableToExcel.prototype.setFontStyle = function (excelFont) {
	   this.fontStyle = excelFont;
   };
   
   TableToExcel.prototype.setRowHeight = function (excelRowHeight) {
	   this.rowHeight = excelRowHeight;
   };
   
   TableToExcel.prototype.setColumnWidth = function (excelColumnWidth) {
	   this.columnWidth = excelColumnWidth;
   };
   
   TableToExcel.prototype.isLineWrap = function (lineWrap) {
	  if (lineWrap == false || lineWrap == true){
		   this.lineWrap = lineWrap;
	  }
   };

   TableToExcel.prototype.setTextAlign = function (textAlign) {
	   this.textAlign = textAlign;
   };
   
   TableToExcel.prototype.isAutoFit = function (autoFit) {
	   if (autoFit == true || autoFit == false)
		   this.autoFit = autoFit;
   }
   
   TableToExcel.prototype.getExcelFile = function () {
   TableToExcel.prototype.getExcelFile = function () {
	   var jXls, myWorkbook, myWorksheet, myHTMLTableCell, myExcelCell, myExcelCell2;
	   var myCellColSpan, myCellRowSpan;
       try {
		   jXls = new ActiveXObject('Excel.Application');
	   }catch(e){
		   alert("无法启动Excel!\n\n" + e.message +
                 "\n\n如果您确信您的电脑中已经安装了Excel，" +
                 "那么请调整IE的安全级别。\n\n具体操作：\n\n" +
				 "工具 → Internet选项 → 安全 → 自定义级别 → 对没有标记为安全的ActiveX进行初始化和脚本运行 → 启用");
		   return false;
	   }
	   jXls.Visible = true;
	   myWorkbook = jXls.Workbooks.Add();
	   jXls.DisplayAlerts = false;
	   myWorkbook.Worksheets(3).Delete();
	   myWorkbook.Worksheets(2).Delete();
	   jXls.DisplayAlerts = true;
	   myWorksheet = myWorkbook.ActiveSheet;
	   var readRow = 0, readCol = 0;
	   var totalRow = 0, totalCol = 0;
	   var tabNum = 0;
	   //设置行高、列宽
	   if (this.columnWidth != -1)
		   myWorksheet.Columns.ColumnWidth = this.columnWidth;
	   else
		   myWorksheet.Columns.ColumnWidth = 7;
	   if (this.rowHeight != -1)
		   myWorksheet.Rows.RowHeight = this.rowHeight;
	   //搜索需要转换的Table对象，获取对应行、列数
	   var obj = document.all.tags("table");
	   for(x = 0; x < obj.length; x++) {
		   if(obj[x].id == this.tableID) {
			   tabNum = x;
			   totalRow = obj[x].rows.length;
			   for (i = 0; i < obj[x].rows[0].cells.length; i++) {
				   myHTMLTableCell = obj[x].rows(0).cells(i);
				   myCellColSpan = myHTMLTableCell.colSpan;
				   totalCol = totalCol + myCellColSpan;
			   }
		   }
       }
	   //开始构件模拟表格
	   var excelTable = new Array();
	   for (i = 0; i <= totalRow; i++) {
		   excelTable[i] = new Array();
		   for (t = 0; t <= totalCol; t++) {
			   excelTable[i][t] = false;
		   }
	  }
   
	  //开始转换表格 
	 for (z = 0; z < obj[tabNum].rows.length; z++) {
		 readRow = z + 1;
		 readCol = 0;
		 //change point 2: start
		 var myExcelCelx1;
		 var myExcelCelx2;
		 var myExcelCely1;
		 var myExcelCely2;
	    //change point 2: end
		 for(c = 0; c < obj[tabNum].rows(z).cells.length; c++) {
			 myHTMLTableCell = obj[tabNum].rows(z).cells(c);
			 myCellColSpan = myHTMLTableCell.colSpan;
			 myCellRowSpan = myHTMLTableCell.rowSpan;
			 for (y = 1; y <= totalCol; y++) {
				 if (excelTable[readRow][y] == false) {
					 readCol = y;
					 break;
				 }
			 }
			 
			 if (myCellColSpan * myCellRowSpan > 1) {
				 myExcelCell = myWorksheet.Cells(readRow, readCol);
				 myExcelCell2 = myWorksheet.Cells(readRow + myCellRowSpan - 1, readCol + myCellColSpan - 1);
				 myWorksheet.Range(myExcelCell, myExcelCell2).Merge();
				 myExcelCell.HorizontalAlignment = this.textAlign;
				 myExcelCell.Font.Size = this.fontSize;
				 myExcelCell.Font.Name = this.fontStyle;
				 myExcelCell.wrapText = this.lineWrap;
				 myExcelCell.Interior.ColorIndex = this.backGround;
                 //change point 2: start
				 if((readRow>=16&&readRow<=20)){
					myExcelCelx1 = myWorksheet.Cells(17, 1);
					myExcelCely1 = myWorksheet.Cells(21 ,6);
					myWorksheet.Range(myExcelCelx1, myExcelCely1).Interior.ColorIndex=15;
					}
					if(readRow==1){
						myWorksheet.Cells(readRow ,1).Font.Size="20";
						var fontWeight=myWorksheet.Cells(readRow ,1);
						fontWeight.Font.Bold=true;
						fontWeight.Rows.RowHeight=40;
					}
					if(readRow==5||readRow==23||readRow==26||readRow==30){
						var WorksheetCells=myWorksheet.Cells(readRow ,1);
						WorksheetCells.Font.Size="15";
						WorksheetCells.Rows.RowHeight=35;
						WorksheetCells.Font.Bold=true;
					}
					if(readRow==2){
						var WorksheetCells=myWorksheet.Cells(readRow ,1);
						WorksheetCells.Font.Size="12";
						WorksheetCells.Rows.RowHeight=40;
					}
					
						myExcelCelx1=myWorksheet.Cells(1,1);
						myExcelCely1=myWorksheet.Cells(1,6);
						myWorksheet.Range(myExcelCelx1, myExcelCely1).Borders(4).Weight = 4;
						myExcelCelx1=myWorksheet.Cells(9,1);
						myExcelCely1=myWorksheet.Cells(9,6);
						myWorksheet.Range(myExcelCelx1, myExcelCely1).Borders(4).Weight = 4;
						myExcelCelx1=myWorksheet.Cells(11,1);
						myExcelCely1=myWorksheet.Cells(11,6);
						myWorksheet.Range(myExcelCelx1, myExcelCely1).Borders(4).Weight = 4;
						myExcelCelx1=myWorksheet.Cells(11,1);
						myExcelCely1=myWorksheet.Cells(11,6);
						myWorksheet.Range(myExcelCelx1, myExcelCely1).Borders(4).Weight = 4;
						myExcelCelx1=myWorksheet.Cells(13,1);
						myExcelCely1=myWorksheet.Cells(13,6);
						myWorksheet.Range(myExcelCelx1, myExcelCely1).Borders(4).Weight = 4;
						
						myExcelCelx1=myWorksheet.Cells(4,1);
						myExcelCely1=myWorksheet.Cells(4,6);
						myExcelCelx2=myWorksheet.Cells(4+1,1);
						myExcelCely2=myWorksheet.Cells(4+1,6);
						myWorksheet.Range(myExcelCelx1, myExcelCely1).Borders(4).Weight = 4;
						myWorksheet.Range(myExcelCelx2, myExcelCely2).Borders(4).Weight = 4;
						
						myExcelCelx1=myWorksheet.Cells(22,1);
						myExcelCely1=myWorksheet.Cells(22,6);
						myExcelCelx2=myWorksheet.Cells(22+1,1);
						myExcelCely2=myWorksheet.Cells(22+1,6);
						myWorksheet.Range(myExcelCelx1, myExcelCely1).Borders(4).Weight = 4;
						myWorksheet.Range(myExcelCelx2, myExcelCely2).Borders(4).Weight = 4;
						
						myExcelCelx1=myWorksheet.Cells(25,1);
						myExcelCely1=myWorksheet.Cells(25,6);
						myExcelCelx2=myWorksheet.Cells(25+1,1);
						myExcelCely2=myWorksheet.Cells(25+1,6);
						myWorksheet.Range(myExcelCelx1, myExcelCely1).Borders(4).Weight = 4;
						myWorksheet.Range(myExcelCelx2, myExcelCely2).Borders(4).Weight = 4;
						
						myExcelCelx1=myWorksheet.Cells(29,1);
						myExcelCely1=myWorksheet.Cells(29,6);
						myExcelCelx2=myWorksheet.Cells(29+1,1);
						myExcelCely2=myWorksheet.Cells(29+1,6);
						myWorksheet.Range(myExcelCelx1, myExcelCely1).Borders(4).Weight = 4;
						myWorksheet.Range(myExcelCelx2, myExcelCely2).Borders(4).Weight = 4;
				       //change point 2: end	
				
					   myExcelCell.Font.ColorIndex = this.fontColor;
					   if (this.tableBorder != -1) {
							 myWorksheet.Range(myExcelCell, myExcelCell2).Borders(1).Weight = this.tableBorder;
							 myWorksheet.Range(myExcelCell, myExcelCell2).Borders(2).Weight = this.tableBorder;
							 myWorksheet.Range(myExcelCell, myExcelCell2).Borders(3).Weight = this.tableBorder;
							 myWorksheet.Range(myExcelCell, myExcelCell2).Borders(4).Weight = this.tableBorder;
						 }
                
						myExcelCell.Value = myHTMLTableCell.innerText;
						for (row = readRow; row <= myCellRowSpan + readRow - 1; row++) {
							 for (col = readCol; col <= myCellColSpan + readCol - 1; col++) {
								 excelTable[row][col] = true;
							}
						 }
						 readCol = readCol + myCellColSpan;
					   }else{
						   myExcelCell = myWorksheet.Cells(readRow, readCol);
						   myExcelCell.Value = myHTMLTableCell.innerText;
						   
						   myExcelCell.HorizontalAlignment = this.textAlign;
						   myExcelCell.Font.Size = this.fontSize;
						   myExcelCell.Font.Name = this.fontStyle;
						
						   myExcelCell.wrapText = this.lineWrap;
						   myExcelCell.Interior.ColorIndex = this.backGround;
						   myExcelCell.Font.ColorIndex = this.fontColor;
						   if (this.tableBorder != -1) {
							   myExcelCell.Borders(1).Weight = this.tableBorder;
							   myExcelCell.Borders(2).Weight = this.tableBorder;
							   myExcelCell.Borders(3).Weight = this.tableBorder;
							   myExcelCell.Borders(4).Weight = this.tableBorder;
						   }
						   excelTable[readRow][readCol] = true;
						   readCol = readCol + 1;
					  }
				   }
			   }
	 
			   if (this.autoFit == true)
				   myWorksheet.Columns.AutoFit;
				   jXls.UserControl = true;
				   jXls = null;
				   myWorkbook = null;
				   myWorksheet = null;
		       };
		   }
