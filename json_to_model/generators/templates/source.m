// Generated by json_to_model
// on {{ time }}

#import "{{ class_name }}.h"

@implementation {{ class_name }}  {

}

- (id)initWithJSONDictionary:(NSDictionary *)dictionary {
{% if super_name == 'NSObject' %}
    self = [super init];
{% else %}
    self = [super initWithJSONDictionary:dictionary];
{% endif %}
    if (self) {
{% for property in properties %} {% if property.type == 'NSInteger' %}
        self.{{ property.name }} = [dictionary[@"{{ property.original_name }}"] integerValue];
{% elif property.type == 'CGFloat' %}
        self.{{ property.name }} = [dictionary[@"{{ property.original_name }}"] floatValue];
{% elif property.type == 'BOOL' %}
        self.{{ property.name }} = [dictionary[@"{{ property.original_name }}"] boolValue];
{% elif property.type == 'NSString *' %}
        self.{{ property.name }} = (dictionary[@"{{ property.original_name }}"] != [NSNull null]) ? dictionary[@"{{ property.original_name }}"] : nil;
{% elif property.type == 'NSArray *' %}
        self.{{ property.name }} = [[NSMutableArray alloc] initWithCapacity:16];
        for (NSDictionary *_ in dictionary[@"{{ property.original_name }}"]) {
            [((NSMutableArray *)self.{{ property.name }}) addObject:[[{{ property.children_type.split(' ')[0] }} alloc] initWithJSONDictionary:_]];
        }
{% else %}
        [self.{{ property.name }} = (dictionary[@"{{ property.original_name }}"] == [NSNull null]) ? nil : [{{ property.type.split(' ')[0] }} alloc] initWithJSONDictionary: dictionary[@"{{ property.original_name }}"]];
{% endif %} {% endfor %}
    }
    return self;
}

- (id)initWithJSONData:(NSData *)data {
    self = [super init];
    if (self) {
        NSError *error = nil;
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (result) {
            self = [self initWithJSONDictionary:result];
        } else {
            return nil;
        }
    }
    return self;
}

- (NSDictionary *)JSONDictionary {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray *_;
{% for property in properties %} {% if property.type == 'NSInteger' %}
    dictionary[@"{{ property.original_name }}"] = @(self.{{ property.name }});
{% elif property.type == 'CGFloat' %}
    dictionary[@"{{ property.original_name }}"] = @(self.{{ property.name }});
{% elif property.type == 'BOOL' %}
    dictionary[@"{{ property.original_name }}"] = @(self.{{ property.name }});
{% elif property.type == 'NSString *' %}
    dictionary[@"{{ property.original_name }}"] = (self.{{ property.name }} != nil) ? self.{{ property.name }} : [NSNull null];
{% elif property.type == 'NSArray *' %}
    _ = [[NSMutableArray alloc] init];
    dictionary[@"{{ property.original_name }}"] = _;
    for ({{ property.children_type.split(' ')[0] }} *__ in self.{{ property.name }}) {
        [_ addObject:[__ JSONDictionary]];
    }
{% else %}
    dictionary[@"{{ property.original_name }}"] = (self.{{ property.name }} == nil) ? [NSNull null] : self.{{ property.name }};
{% endif %} {% endfor %}
    return dictionary;
}


- (NSData *)JSONData {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:[self JSONDictionary] options:0 error:&error];
    if (error) {
        @throw error;
    }
    return data;
}


@end