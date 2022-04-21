function main()
    n, m = parse.(Int, split(readline()))
    ss = split(readline())
    ts = split(readline())
    k = 0
    for i in 1:m
        while k < n
            k += 1
            if ss[k] == ts[i]
                println("Yes")
                break
            else
                println("No")
            end
        end
    end
end

main()
