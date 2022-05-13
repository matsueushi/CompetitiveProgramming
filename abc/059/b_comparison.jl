function main()
    a = readline()
    b = readline()
    lena = length(a)
    lenb = length(b)
    if a == b
        println("EQUAL")
    elseif lena < lenb
        println("LESS")
    elseif lena > lenb
        println("GREATER")
    elseif a < b
        println("LESS")
    elseif a > b
        println("GREATER")
    end
end

main()
