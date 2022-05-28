parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function main()
    n = parseint()
    as = parseints()
    if iseven(n)
        println(join(vcat(reverse(as[2:2:end]), as[1:2:end]), " "))
    else
        println(join(vcat(reverse(as[1:2:end]), as[2:2:end]), " "))
    end
end

main()
