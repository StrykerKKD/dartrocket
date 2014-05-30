part of dartrocket;

class Text extends StageXL.TextField {

  Text(text, [StageXL.TextFormat textformat]): super() {
    this.text = text;
    if (textformat == null) {
      this.defaultTextFormat = new StageXL.TextFormat('Arial', 14,
          StageXL.Color.Black, bold: true, italic: true);
    }
  }
}
