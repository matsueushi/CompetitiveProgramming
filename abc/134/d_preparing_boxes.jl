parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, bs)
    boxes = falses(n)
    r = n >> 1
    boxes[r+1:end] = bs[r+1:end]
    while r > 0
        l = r >> 1
        for i in r:-1:l+1
            t = false
            for v in i:i:n
                t ⊻= boxes[v]
            end
            boxes[i] = bs[i] != t
        end
        r = l
    end
    findall(boxes)
end

function main()
    n = parseint()
    bs = parseints()
    xs = solve(n, bs)
    println(length(xs))
    if !isempty(xs)
        println(join(xs, " "))
    end
end

main()
