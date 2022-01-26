function nextblock(bs)
    bs[end] += 1
    for i in Iterators.reverse(2:length(bs))
        if bs[i] > i
            bs[i-1:end] .= bs[i-1] + 1
        end
    end
    first(bs) == 2 && return nothing
    bs
end

function blocks(n)
    xs = Vector{Int64}[]
    m = n ÷ 2 - 1
    bs = zeros(m)
    while (!isnothing(bs))
        push!(xs, bs)
        bs = nextblock(bs)
    end
    xs
end

function printblock(bs)
    s = "("
    x = 0
    for b in bs
        dx = b - x
        s *= ")"^dx * "("
        x = b
    end
    s *= ")"^(1 + length(bs) - x)
    println(s)
end

function parentheses(n)
    if isodd(n)
        return
    elseif n == 2
        println("()")
        return
    else
        foreach(printblock, blocks(n))
        return
    end
end

n = parse(Int64, readline())
parentheses(n)
