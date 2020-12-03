#include <sys/syscall.h>

.globl _main
.text


_main:
  pushq   %rbp
  movq    %rsp, %rbp
  movl    $0, -4(%rbp)

loop1:
  cmpl    $200, -4(%rbp)
  jge     out

  # load loop1 value
  movl    -4(%rbp), %eax
  leaq    0(,%rax,4), %rdx
  leaq    input(%rip), %rax
  movl    (%rdx,%rax), %ecx

  movl    %ecx, -16(%rbp)

  movl    $0, -8(%rbp)

loop2:
  cmpl    $200, -8(%rbp)
  jge     loop1_inc

  # load loop2 value
  movl    -8(%rbp), %eax
  cltq
  leaq    0(,%rax,4), %rdx
  leaq    input(%rip), %rax
  movl    (%rdx,%rax), %ecx

  movl    %ecx, -20(%rbp)

  # add 1 + 2
  addl    -16(%rbp), %ecx
  # cmpl    $2020, %ecx
  # jge     loop2_inc

  movl    %ecx, -28(%rbp)

  # reset loop 3 loop counter
  movl    $0, -12(%rbp)

loop3:
  cmpl    $200, -12(%rbp)
  jge     loop2_inc

  # load loop3 value
  movl    -12(%rbp), %eax
  cltq
  leaq    0(,%rax,4), %rdx
  leaq    input(%rip), %rax
  movl    (%rdx,%rax), %ecx

  movl    %ecx, -24(%rbp)

  addl    -28(%rbp), %ecx

  cmpl    $2020, %ecx
  je      out

  addl    $1, -12(%rbp)
  jmp     loop3

loop2_inc:
  addl    $1, -8(%rbp)
  jmp     loop2

loop1_inc:
  addl    $1, -4(%rbp)
  jmp     loop1


out:
  # multiply
  movl    -16(%rbp), %eax
  movl    -20(%rbp), %edx
  imulq   %rdx, %rax
  movl    -24(%rbp), %edx
  imulq   %rdx, %rax

  # print result
  lea  format(%rip), %rdi
  movq  %rax, %rsi
  xor %eax, %eax
  call _printf


  nop
  popq    %rbp
  ; ret

format: .asciz "%d\n"
input:
  .long 1544
  .long 1560
  .long 1947
  .long 1659
  .long 1972
  .long 1940
  .long 1977
  .long 1689
  .long 1916
  .long 1638
  .long 1804
  .long 1543
  .long 1789
  .long 545
  .long 968
  .long 1959
  .long 1783
  .long 1869
  .long 1581
  .long 1976
  .long 1859
  .long 1660
  .long 1793
  .long 69
  .long 1653
  .long 1866
  .long 1541
  .long 1920
  .long 1751
  .long 1681
  .long 1829
  .long 2009
  .long 1752
  .long 680
  .long 1864
  .long 1628
  .long 1917
  .long 1876
  .long 2002
  .long 1974
  .long 1827
  .long 1791
  .long 1552
  .long 1669
  .long 1849
  .long 1167
  .long 1744
  .long 1764
  .long 1913
  .long 1782
  .long 1926
  .long 1795
  .long 1738
  .long 1877
  .long 1811
  .long 1746
  .long 1682
  .long 1943
  .long 1761
  .long 1850
  .long 983
  .long 1617
  .long 1901
  .long 1750
  .long 1842
  .long 1588
  .long 1679
  .long 1759
  .long 1994
  .long 1847
  .long 1657
  .long 1981
  .long 1648
  .long 1996
  .long 1572
  .long 1953
  .long 1555
  .long 1665
  .long 1680
  .long 1872
  .long 1826
  .long 1316
  .long 1962
  .long 1893
  .long 1545
  .long 1535
  .long 1895
  .long 1819
  .long 1891
  .long 1919
  .long 1853
  .long 1831
  .long 704
  .long 1978
  .long 1780
  .long 1722
  .long 1652
  .long 1625
  .long 478
  .long 1030
  .long 1985
  .long 1720
  .long 1817
  .long 264
  .long 1988
  .long 1892
  .long 1712
  .long 1222
  .long 1840
  .long 1894
  .long 1906
  .long 1890
  .long 1846
  .long 1939
  .long 1991
  .long 1835
  .long 1799
  .long 1865
  .long 1663
  .long 1908
  .long 1575
  .long 1970
  .long 1956
  .long 1556
  .long 1688
  .long 1558
  .long 1698
  .long 1771
  .long 1807
  .long 1878
  .long 1707
  .long 1770
  .long 1823
  .long 1802
  .long 1930
  .long 1703
  .long 1136
  .long 1910
  .long 1998
  .long 1973
  .long 1611
  .long 1979
  .long 1612
  .long 1838
  .long 1715
  .long 1885
  .long 1879
  .long 1904
  .long 1941
  .long 1734
  .long 1900
  .long 1809
  .long 1691
  .long 1848
  .long 1683
  .long 1754
  .long 1874
  .long 1975
  .long 1896
  .long 1567
  .long 1785
  .long 1644
  .long 1922
  .long 1651
  .long 1046
  .long 1971
  .long 1600
  .long 1933
  .long 1857
  .long 1960
  .long 1948
  .long 1675
  .long 1828
  .long 1633
  .long 1868
  .long 1615
  .long 1884
  .long 1674
  .long 1860
  .long 1775
  .long 995
  .long 1596
  .long 2006
  .long 1737
  .long 1649
  .long 1997
  .long 1767
  .long 1784
  .long 1705
  .long 1664
  .long 1766
  .long 1839
  .long 1533
  .long 1935
  .long 1796
  .long 1781
  .long 1589
  .long 1594
  .long 1987
  .long 1769
  