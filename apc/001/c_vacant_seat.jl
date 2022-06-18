parseint() = parse(Int, readline())

function solve()

end

function main()
    n = parseint()
    println(0)
    flush(stdout)
    res = readline()
    res == "Vacant" && return
    l = 0
    r = n
    ls = rs = res
    for i in 1:20
        m = (l + r) >> 1
        println(m)
        flush(stdout)
        res = readline()
        res == "Vacant" && return
        if isodd(m - l)
            if res != ls
                l = m
                ls = res
            else
                r = m
                rs = res
            end
        else
            if res == ls
                l = m
                rs = res
            else
                r = m
                rs = res
            end
        end
    end

end

main()
