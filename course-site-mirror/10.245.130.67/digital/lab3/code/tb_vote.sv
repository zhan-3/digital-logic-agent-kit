module tb_vote;

    logic a, b, c;
    logic vote;

    vote  vote_inst (
    .a(a),
    .b(b),
    .c(c),
    .vote(vote)
  );

    initial begin
    $dumpfile("tb_vote.vcd");
    $dumpvars(0, tb_vote);
    
    end
    
    initial begin
        for (int i = 0; i < 20; i++) begin
            {a, b, c} = i[2:0];
            #1;
            $display("a=%b b=%b c=%b => vote=%b", a, b, c, vote);
        end

        $finish;
    end

endmodule