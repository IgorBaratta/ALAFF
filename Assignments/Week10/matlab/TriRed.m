function [ A_out, t_out ] = TriRed( A, t )

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  [ tT, ...
    tB ] = FLA_Part_2x1( t, ...
                         0, 'FLA_TOP' );

  while ( size( ATL, 1 ) < size( A, 1 )-1 )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    [ t0, ...
      tau1, ...
      t2 ] = FLA_Repart_2x1_to_3x1( tT, ...
                                    tB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    







    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

    [ tT, ...
      tB ] = FLA_Cont_with_3x1_to_2x1( t0, ...
                                       tau1, ...
                                       t2, ...
                                       'FLA_TOP' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];

  t_out = [ tT
            tB ];

return
