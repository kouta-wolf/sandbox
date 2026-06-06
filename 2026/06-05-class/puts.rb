# putsはKernelモジュールで定義されたメソッド
# 両方とも同じ意味です。ただしprivateメソッドなのでputsを呼び出す際にはselfを付けないのが一般的です。

puts "Hi" # => Hi
self.puts("Hi") # => Hi
