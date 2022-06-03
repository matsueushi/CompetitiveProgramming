parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function main()
    s = readline()
    q = parseint()
    f = true
    hs = Char[]
    ts = Char[]
    for i in 1:q
        ins = split(readline())
        if ins[1] == "1"
            f = !f
        else
            x = ins[3][1]
            if ins[2] == "1"
                if f
                    push!(hs, x)
                else
                    push!(ts, x)
                end
            else
                if f
                    push!(ts, x)
                else
                    push!(hs, x)
                end
            end
        end
    end
    res = join(reverse(hs)) * s * join(ts)
    if !f
        res = reverse(res)
    end
    println(res)
end

main()
