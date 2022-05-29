function main()
    n, a, b = parse.(Int, split(readline()))
    s = readline()

    cand = 0
    bord = 0
    for x in s
        if x == 'a'
            if cand < a + b
                cand += 1
                println("Yes")
            else
                println("No")
            end
        elseif x == 'b'
            bord += 1
            if cand < a + b && bord ≤ b
                cand += 1
                println("Yes")
            else
                println("No")
            end
        else
            println("No")
        end
    end
end

main()
