module tb_mux_2();
    logic [1:0] D;
    logic s;
    logic y;

    initial begin
        $dumpfile("tb_mux_2.vcd");
        $dumpvars(0, tb_mux_2);
    end

    mux_2 dut (
        .D(D),
        .s(s),
        .y(y)
    );

    initial begin
        $display("D[1] D[0] s | y");
        for(int i = 0; i < 4; i++) begin
            D = i;
            for(int j = 0; j < 2; j++) begin
                s = j;
                #10;
                $display("%b %b %b | %b", D[1], D[0], s, y);
            end
        end
        $finish;
    end
endmodule