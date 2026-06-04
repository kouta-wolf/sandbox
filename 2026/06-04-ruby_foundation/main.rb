# 全てのデータはオブジェクトであり、オブジェクトはクラスを知っている
p 1.is_a?(Object) # => true
p 1.class # => Integer

# クラスもオブジェクトであり、クラスはClassクラスを知っている
p Integer.is_a?(Object) # => true
p Integer.class # => Class

# putsはkernelモジュールから呼び出される
p method(:puts) # => #<Method: Object(Kernel)#puts(*)>

p method(:puts).parameters # => [[:rest]]  残りの引数すべてという意味でputsは可変長引数
