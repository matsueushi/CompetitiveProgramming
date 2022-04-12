function main()
    s1, s2, s3 = split(readline())
    t1, t2, t3 = split(readline())
    eq = 0
    s1 == t1 && (eq += 1)
    s2 == t2 && (eq += 1)
    s3 == t3 && (eq += 1)
    if eq == 0 || eq == 3
        println("Yes")
    else
        println("No")
    end
end

main()
