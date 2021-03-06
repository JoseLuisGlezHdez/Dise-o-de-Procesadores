module alu(input wire [7:0] a, b, // se�ales que dan los dos datos con los que se van a haCer operaciones.
           input wire [2:0] op, // opcode, determina que operaci�n va a hacer la ALU
           output wire [7:0] y, // salida, resultado de las operaciones que se hagan entre a y b seg�n el opcode op.
           output wire zero);

reg [7:0] s; // registro interno de la ALU que almacena temporalmente el resultado de las operaciones.
		   
		   
always @(a, b, op) //op es el c�digo de operaciones, seg�n el c�digo de operaciones la ALU hace las 
		    // operaciones siguientes:
begin
  case (op)              
    3'b000: s = a;
    3'b001: s = ~a;
    3'b010: s = a + b;
    3'b011: s = a - b;
    3'b100: s = a & b;
    3'b101: s = a | b;
    3'b110: s = -a;
    3'b111: s = -b;
	default: s = 'bx; //desconocido en cualquier otro caso (x � z), por si se modifica el c�digo
  endcase
end

assign y = s; // Se asigna a la se�al de salida y el valor del registro interno de la ALU s.

//Calculo del flag de cero
assign zero = ~(|y);   // operador de reducci�n |y hace la or de los bits del vector 'y' y devuelve 1 bit 
			// resultado
		   
endmodule
