;sbsbsbsbsbsbsb
;sbsbsbsbsbsbsb
; ModuleID = 'MicroC'

@zero = global i8* null
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt3 = private unnamed_addr constant [4 x i8] c"%c\0A\00"
@fmt4 = private unnamed_addr constant [2 x i8] c"a\00"
@tmp1 = private unnamed_addr constant [2 x i8] c"r\00"
@fmt1 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt22 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt33 = private unnamed_addr constant [4 x i8] c"%c\0A\00"
@fmt44 = private unnamed_addr constant [2 x i8] c"a\00"
@tmp15 = private unnamed_addr constant [160 x i8] c"Aman Chahar Miao Yu Baokun Cheng Sikai Huang this is a sample code sepearted by the space and the function will return an array of strings each contains a word\00"
@tmp16 = private unnamed_addr constant [2 x i8] c" \00"
@tmp17 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt8 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt29 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt310 = private unnamed_addr constant [4 x i8] c"%c\0A\00"
@fmt411 = private unnamed_addr constant [2 x i8] c"a\00"

declare i32 @printf(i8*, ...)

declare i1 @feof(i8*)

declare i8 @fgetc(i8*)

declare i8* @fopen(i8*, i8*)

declare i8* @fputs(i8*, i8*)

declare i8* @fseek(i8*, i64, i32)

declare i64 @ftell(i8*)

declare i8 @fputc(i8, i8*)

declare i32 @remove(i8*)

declare i32 @rename(i8*, i8*)

declare i8 @memcpy(i8*, i8*, i32)

declare i8* @malloc(i32)

declare i8* @calloc(i32, i32)

declare i8* @strtok(i8*, i8*)

declare i32 @itoa(i8*)

declare i8* @free(i8*)

define i32 @countline(i8* %path) {
entry:
  %path1 = alloca i8*
  store i8* %path, i8** %path1
  %count = alloca i32
  %c = alloca i8
  %f = alloca i8*
  store i32 1, i32* %count
  %path2 = load i8** %path1
  %tmp2 = call i8* @fopen(i8* %path2, i8* getelementptr inbounds ([2 x i8]* @tmp1, i32 0, i32 0))
  store i8* %tmp2, i8** %f
  br label %while

while:                                            ; preds = %merge, %entry
  %f8 = load i8** %f
  %temp19 = call i1 @feof(i8* %f8)
  %tmp10 = xor i1 %temp19, true
  br i1 %tmp10, label %while_body, label %merge11

while_body:                                       ; preds = %while
  %f3 = load i8** %f
  %temp1 = call i8 @fgetc(i8* %f3)
  store i8 %temp1, i8* %c
  %c4 = load i8* %c
  %tmp = icmp eq i8 %c4, 10
  br i1 %tmp, label %then, label %else

merge:                                            ; preds = %else, %then
  br label %while

then:                                             ; preds = %while_body
  %count5 = load i32* %count
  %tmp6 = add i32 %count5, 1
  store i32 %tmp6, i32* %count
  %tmp7 = sub i32 %tmp6, 1
  br label %merge

else:                                             ; preds = %while_body
  br label %merge

merge11:                                          ; preds = %while
  %count12 = load i32* %count
  ret i32 %count12
}

define i32 @main() {
entry:
  %a = alloca i8*
  %token = alloca i8*
  %t = alloca i8*
  %d = alloca i8**
  %i = alloca i32
  %u = alloca i1
  store i8* getelementptr inbounds ([160 x i8]* @tmp15, i32 0, i32 0), i8** %a
  %a1 = load i8** %a
  %u_result = call i8** @u(i8* %a1, i32 30, i8* getelementptr inbounds ([2 x i8]* @tmp16, i32 0, i32 0))
  store i8** %u_result, i8*** %d
  store i32 0, i32* %i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i6 = load i32* %i
  %tmp7 = icmp slt i32 %i6, 30
  br i1 %tmp7, label %while_body, label %merge

while_body:                                       ; preds = %while
  %d2 = load i8*** %d
  %i3 = load i32* %i
  %tmpp = getelementptr inbounds i8** %d2, i32 %i3
  %deref = load i8** %tmpp
  %tmp1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @tmp17, i32 0, i32 0), i8* %deref)
  %i4 = load i32* %i
  %tmp = add i32 %i4, 1
  store i32 %tmp, i32* %i
  %tmp5 = sub i32 %tmp, 1
  br label %while

merge:                                            ; preds = %while
  ret i32 0
}

define i8** @u(i8* %a, i32 %c, i8* %b) {
entry:
  %a1 = alloca i8*
  store i8* %a, i8** %a1
  %c2 = alloca i32
  store i32 %c, i32* %c2
  %b3 = alloca i8*
  store i8* %b, i8** %b3
  %p = alloca i8**
  %i = alloca i32
  %c4 = load i32* %c2
  %tmpa = call i8* @calloc(i32 %c4, i32 ptrtoint (i1** getelementptr (i1** null, i32 1) to i32))
  %tmpb = bitcast i8* %tmpa to i8**
  store i8** %tmpb, i8*** %p
  %p5 = load i8*** %p
  %b6 = load i8** %b3
  %a7 = load i8** %a1
  %tmpx = call i8* @strtok(i8* %a7, i8* %b6)
  %tmpp = getelementptr inbounds i8** %p5, i32 0
  store i8* %tmpx, i8** %tmpp
  store i32 1, i32* %i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i15 = load i32* %i
  %c16 = load i32* %c2
  %tmp17 = icmp slt i32 %i15, %c16
  br i1 %tmp17, label %while_body, label %merge

while_body:                                       ; preds = %while
  %p8 = load i8*** %p
  %i9 = load i32* %i
  %b10 = load i8** %b3
  %zero = load i8** @zero
  %tmpx11 = call i8* @strtok(i8* %zero, i8* %b10)
  %tmpp12 = getelementptr inbounds i8** %p8, i32 %i9
  store i8* %tmpx11, i8** %tmpp12
  %i13 = load i32* %i
  %tmp = add i32 %i13, 1
  store i32 %tmp, i32* %i
  %tmp14 = sub i32 %tmp, 1
  br label %while

merge:                                            ; preds = %while
  %p18 = load i8*** %p
  ret i8** %p18
}
