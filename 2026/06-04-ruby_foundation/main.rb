# 全てのデータはオブジェクトであり、オブジェクトはクラスを知っている
p 1.is_a?(Object) # => true
p 1.class # => Integer

# クラスもオブジェクトであり、クラスはClassクラスを知っている
p Integer.is_a?(Object) # => true
p Integer.class # => Class

# Class.classもオブジェクトであり、ClassクラスはClassクラスを知っている
p Class.is_a?(Object) # => true
p Class.class # => Class

# オブジェクトは遡るといずれKernelにたどりつく
p Class.ancestors # => [Class, Module, Object, Kernel, BasicObject]

# putsはmainオブジェクトのkernelモジュールから呼び出される
p method(:puts) # => #<Method: Object(Kernel)#puts(*)>
p method(:puts).parameters # => [[:rest]]  残りの引数すべてという意味でputsは可変長引数

# メソッドはオブジェクトではないが、オブジェクトに変換できる
p method(:puts).is_a?(Object) # => true
p method(:puts).class # => Method
p Method.class # => Class



