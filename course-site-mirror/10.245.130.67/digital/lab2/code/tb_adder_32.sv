module tb_adder_32();
    logic [31:0] a, b;
    logic cin;
    logic [31:0] s;
    logic cout;

    initial begin
        $dumpfile("tb_adder_32.vcd");
        $dumpvars(0, tb_adder_32);
    end

    adder_32 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    
    initial begin
        $display("a + b + cin | s cout");

        for (int i = 0; i < 16; i++) begin
            a = $random();             // 生成 32 位无符号随机数;
            b = $random();             // 生成 32 位无符号随机数;
            cin = i % 2;
            # 10
            $display("%d + %d + %b | %d %b", a, b, cin, s, cout);

            if (s !== (a + b + cin)) begin
                $display("ERROR: mismatch at input a=%d b=%d cin=%b -> expected s=%d, got s=%d",
                         a, b, cin, (a + b + cin), s);
                $fatal(1, "adder_32 functional check failed");
            end
        end

        $display("All tests passed.");
        $finish;
    end
endmodule