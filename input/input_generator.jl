function main()
    n = 200000
    m = 199999
    println("$n $m")
    for i in 2:n
        println("1 $i")
    end
    println(n)
    for i in 1:n
        println("1 $i")
    end
end

function make_input()
    h, w = 80, 80
    println("$h $w")
    a = rand(1:80, h, w)
    b = rand(1:80, h, w)
    for i in 1:h
        println(join(a[i, :]), " ")
    end
    for i in 1:h
        println(join(b[i, :]), " ")
    end
end

main()
